class TransactionImporter
  class << self
    def import_for(bitcoin_address)
    end

    def pull_transactions(addresses)
      DBC.require(addresses)
      
      extract_transactions Api::BlockExplorer.mytransactions(addresses),  addresses 
    end
    
    def pull_transaction(hash, addresses)
      extract_transaction Api::BlockExplorer.rawtx(hash), addresses
    end
    
    def extract_transactions(json, addresses)
      json.collect do |k, transaction_json|
        extract_transaction transaction_json, addresses, json
      end
    end
    
    def extract_transaction(tx_hash, addresses, json = {})
      transaction = Transaction.new
      tx = Bitcoin::Protocol::Tx.from_hash(tx_hash)

      tx.out.each do |tx_out|
        addr = Bitcoin::Script.new(tx_out.pk_script).get_address
        if addresses.include? addr
          ba = BitcoinAddress.new address: addr
          amount = BigDecimal(tx_out.value) / (10**8)
          transaction.payments.build amount: amount, bitcoin_address: ba
        end
      end

      tx.in.select { |tx_in| json[tx_in.previous_output].present? }.each do |tx_in|
        node = json[tx_in.previous_output]['out'][tx_in.prev_out_index]

        addr = node['address'] || Bitcoin::Script.new(node['scriptPubKey']).get_address
        ba = BitcoinAddress.new address: addr
        amount = -BigDecimal(node['value'])
        
        transaction.payments.build amount: amount, bitcoin_address: ba
      end
      
      transaction
    end
 
  end
end