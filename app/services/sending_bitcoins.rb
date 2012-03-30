class SendingBitcoins
  class << self
    def create_tx(options)
      DBC.require(options[:to])
      DBC.require(options[:amount])

      tx = Bitcoin::Protocol::Tx.new
      bas = []

      ActiveRecord::Base.transaction do
        amount = add_inputs_and_outputs(tx, bas, options[:amount], options[:to])

        sign_inputs(tx, bas)

        tx_fees = amount - (tx.out.sum {|o| BigDecimal(o.value.to_s) }  / Wallet::Offset)
        DBC.ensure(tx_fees <= 0.01, "fees of #{tx_fees} too big")
      end
      tx
    end
    
    private

    def add_inputs_and_outputs(tx, bas, sending_amount, to_address)
      amount = BigDecimal("0")

      BitcoinAddress.sorted_and_non_zero_balance.each do |ba|
        bas << ba

        tx.add_in get_tx_in(ba)

        amount += ba.balance
        remainder = amount - sending_amount

        if remainder >= BigDecimal("0")
          if remainder > BigDecimal("0")
            send_reminder_to_self tx, remainder
          end
          break
        end
      end

      tx.add_out Bitcoin::Protocol::TxOut.value_to_address(sending_amount * Wallet::Offset, to_address)

      amount
    end

    def sign_inputs(tx, bas)
      bas.each_with_index do |ba, i|
        prev_tx = Bitcoin::Protocol::Tx.new(ba.most_recent_transaction.binary)
        sig = Bitcoin.sign_data(Bitcoin.open_key(ba.private_key), tx.signature_hash_for_input(i, prev_tx))
        tx.in[i].script_sig = Bitcoin::Script.to_signature_pubkey_script(sig, [ba.public_key].pack("H*"))

        DBC.assert(tx.verify_input_signature(i, prev_tx))
      end
    end

    def send_reminder_to_self(tx, remainder)
      DBC.require(remainder > 0)

      ba = BitcoinAddress.generate
      ba.description = "Auto generated for remainder"
      ba.save!
      tx.add_out Bitcoin::Protocol::TxOut.value_to_address(remainder * Wallet::Offset, ba.address)
    end

    def get_tx_in(bitcoin_address)
      prev_tx = Bitcoin::Protocol::Tx.new(bitcoin_address.most_recent_transaction.binary)

      prev_tx_index = prev_tx.out.find_index {|tx| Bitcoin::Script.new(tx.pk_script).get_address == bitcoin_address.address }      
      DBC.assert(prev_tx_index)

      Bitcoin::Protocol::TxIn.new(prev_tx.binary_hash, prev_tx_index, 0)
    end
   
   
  end
end
