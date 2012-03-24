class Wallet
  class << self
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
          if amount > options[:amount]
            partial_paying_ba = ba
          end
        
          break
        end
      end

      tx.add_out Bitcoin::Protocol::TxOut.value_to_address(amount * 10000000, options[:to])
      if partial_paying_ba 
        remainder_ba = BitcoinAddress.generate
        remainder_ba.save!
        tx.add_out Bitcoin::Protocol::TxOut.value_to_address(amount * 10000000, remainder_ba.address)
      end
      
      bas.each_with_index do |ba, i|
        prev_tx = Bitcoin::Protocol::Tx.new(ba.most_recent_transaction.binary)
        sig = Bitcoin.sign_data(Bitcoin.open_key(ba.private_key), tx.signature_hash_for_input(i, prev_tx))
        tx.in[i].script_sig = Bitcoin::Script.to_signature_pubkey_script(sig, [ba.public_key].pack("H*"))
      end
      
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