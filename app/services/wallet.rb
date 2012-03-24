class Wallet
  class << self
    Offset = 100000000
    
    def balance
      Payment.sum(:amount)
    end
    
    def send_bitcoins_tx(options)
      DBC.require(balance > 0, "Balance must be greater then 0")
      DBC.require(options[:to])
      DBC.require(options[:amount])
     
      tx = Bitcoin::Protocol::Tx.new
      amount = BigDecimal("0")
      bas = []
      partial_paying_ba = nil
      
      BitcoinAddress.sorted_and_non_zero_balance.each do |ba|
        bas << ba

        tx.add_in get_tx_in(ba)
      
        amount += ba.balance
            
        if amount >= options[:amount]
          break
        end
      end
      
      tx.add_out Bitcoin::Protocol::TxOut.value_to_address(options[:amount] * Offset, options[:to])
      if amount > options[:amount] 
        diff = amount - options[:amount]
        remainder_ba = BitcoinAddress.generate
        remainder_ba.description = "Auto generated for remainder"
        remainder_ba.save!
        tx.add_out Bitcoin::Protocol::TxOut.value_to_address(diff * Offset, remainder_ba.address)
      end
      
      bas.each_with_index do |ba, i|
        prev_tx = Bitcoin::Protocol::Tx.new(ba.most_recent_transaction.binary)
        sig = Bitcoin.sign_data(Bitcoin.open_key(ba.private_key), tx.signature_hash_for_input(i, prev_tx))
        tx.in[i].script_sig = Bitcoin::Script.to_signature_pubkey_script(sig, [ba.public_key].pack("H*"))
        
        DBC.assert(tx.verify_input_signature(i, prev_tx))
      end
      
      tx_fees = amount - tx.out.sum {|o| o.value / Offset }
      DBC.ensure(tx_fees <= 0.01)
      tx
    end
    
    private
    
    def get_tx_in(bitcoin_address)
      prev_tx = Bitcoin::Protocol::Tx.new(bitcoin_address.most_recent_transaction.binary)

      prev_tx_index = prev_tx.out.find_index {|tx| Bitcoin::Script.new(tx.pk_script).get_address == bitcoin_address.address }      
      DBC.assert(prev_tx_index)
      
      Bitcoin::Protocol::TxIn.new(prev_tx.binary_hash, prev_tx_index, 0)
    end
    
  end
end