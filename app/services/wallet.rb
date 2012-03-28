class Wallet
  Offset = BigDecimal((10**8).to_s)

  class << self
    
    def balance
      Payment.sum(:amount)
    end
    
    def send_bitcoins(options)
      DBC.require(balance > 0, "Balance must be greater then 0")
      DBC.require(options[:to])
      DBC.require(options[:amount])
      DBC.require(options[:amount] > 0, "Must send amount greater then 0")
      DBC.require(options[:amount] <= balance, "Must send amount less than or equal to balance")

      tx = send_bitcoins_tx(options)
      transaction = TransactionImporter.import_tx tx
      TransactionImporter.process_payments_for [transaction]
      Api::TransactionTransmitter.transmit(tx)
    end
        
    private
    
    def send_bitcoins_tx(options)
      DBC.require(balance > 0, "Balance must be greater then 0")
      DBC.require(options[:to])
      DBC.require(options[:amount])
     
      tx = Bitcoin::Protocol::Tx.new
      bas = []

      amount = add_inputs_and_outputs(tx, bas, options[:amount], options[:to])
      
      sign_inputs(tx, bas)
      
      tx_fees = amount - tx.out.sum {|o| o.value / Offset }
      DBC.ensure(tx_fees == 0, "fees of #{tx_fees} did not equal 0")
      tx
    end
    
    def add_inputs_and_outputs(tx, bas, sending_amount, to_address)
      amount = BigDecimal("0")

      BitcoinAddress.sorted_and_non_zero_balance.each do |ba|
        bas << ba

        tx.add_in get_tx_in(ba)
      
        amount += ba.balance
        remainder = amount - sending_amount
            
        if remainder >= 0
          if remainder > 0
            send_reminder_to_self tx, remainder
          end
          break
        end
      end

      tx.add_out Bitcoin::Protocol::TxOut.value_to_address(sending_amount * Offset, to_address)
      
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
      tx.add_out Bitcoin::Protocol::TxOut.value_to_address(remainder * Offset, ba.address)
    end
    
    def get_tx_in(bitcoin_address)
      prev_tx = Bitcoin::Protocol::Tx.new(bitcoin_address.most_recent_transaction.binary)

      prev_tx_index = prev_tx.out.find_index {|tx| Bitcoin::Script.new(tx.pk_script).get_address == bitcoin_address.address }      
      DBC.assert(prev_tx_index)
      
      Bitcoin::Protocol::TxIn.new(prev_tx.binary_hash, prev_tx_index, 0)
    end
    
  end
end