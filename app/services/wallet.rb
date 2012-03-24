class Wallet
  class << self
    def balance
      Payment.sum(:amount)
    end
    
    def send_bitcoins(options)
      DBC.require(balance > 0)
      DBC.require(options[:to])
      DBC.require(options[:amount])
     
      tx = Bitcoin::Protocol::Tx.new
      bas = []
      amount = BigDecimal("0")
      partial_paying_ba = nil
      
      BitcoinAddress.sorted_by_balance.each do |ba|
        prev_tx = Bitcoin::Protocol::Tx.new(ba.most_recent_transaction.binary)
        bas << ba
        tx_in = get_tx_in(ba)
        tx.add_in tx_in
        
        amount += ba.balance
        
        sig = Bitcoin.sign_data(key, tx.signature_hash_for_input(0, prev_tx))
        tx_in.script_sig = Bitcoin::Script.to_signature_pubkey_script(sig, [key.public_key_hex].pack("H*"))
        
        if amount >= options[:amount]
          if amount > options[:amount]
            partial_paying_ba = ba
          end
          
          break
        end
      end

      tx.add_out Bitcoin::Protocol::TxOut.value_to_address(amount, options[:to])
      if partial_paying_ba 
        remainder_ba = BitcoinAddress.generate
        remainder_ba.save!
        tx.add_out Bitcoin::Protocol::TxOut.value_to_address(amount, remainder_ba.address)
      end
      
      # tx.in.each_with_index do |tx_in, i|
      #   sig = Bitcoin.sign_data(key, tx.signature_hash_for_input(0, prev_tx))
      #   tx.in[i].script_sig = Bitcoin::Script.to_signature_pubkey_script(sig, [key.public_key_hex].pack("H*"))
      # end

      
      # key = Bitcoin.open_key("1e2e0bc6893d42a462b0039b5c15c3da3378c8d0ec44556b9608efdb2b3caff1")
      # prev_tx = Bitcoin::Protocol::Tx.from_json(open('http://blockexplorer.com/rawtx/6c5067ee83752022110fafefefcbbba9f006c2c90bce0d7cba4c28258831e0af').read)
      # tx = Bitcoin::Protocol::Tx.new
      # # add input:0
      # tx.add_in Bitcoin::Protocol::TxIn.new(prev_tx.binary_hash, 1, 0)
      # # add output:0
      # tx.add_out Bitcoin::Protocol::TxOut.value_to_address(10000000, "1Eqr3DVzC1c2n85WkffznhXTp2dmUY6RLm")
      # # if all in and outputs are defined, start signing inputs.
      # sig = Bitcoin.sign_data(key, tx.signature_hash_for_input(0, prev_tx))
      # tx.in[0].script_sig = Bitcoin::Script.to_signature_pubkey_script(sig, [key.public_key_hex].pack("H*"))
      # # finish check
      # 
      # tx = Bitcoin::Protocol::Tx.new( tx.to_payload )
      
      # t = Transaction.new binary: 
      # p = Payment.new amount: options[:amount]
      
    end
    
    private

    def get_tx_in(bitcoin_address)
      prev_tx = Bitcoin::Protocol::Tx.new(bitcoin_address.most_recent_transaction.binary)

      prev_tx_index = prev_tx.out.find {|tx| Bitcoin::Script.new(tx.pk_script).get_address == bitcoin_address.address }      
      DBC.assert(prev_tx_index)
      
      Bitcoin::Protocol::TxIn.new(prev_tx.binary_hash, prev_tx_index, 0)
    end
    
  end
end