class TransactionImporter
  class << self

    def pull_transactions(bitcoin_addresses)
      DBC.require(bitcoin_addresses)
      
      extract_transactions Api::BlockExplorer.mytransactions(bitcoin_addresses),  bitcoin_addresses 
    end
    
    def extract_transactions(json, bitcoin_addresses)
      json.collect do |k, transaction_json|
        extract_transaction(json, bitcoin_addresses, transaction_json)
      end
    end
    
    def extract_transaction(json, bitcoin_addresses, tx_hash)
      transaction = Transaction.new
      tx = Bitcoin::Protocol::Tx.from_hash(tx_hash)

      tx.out.each do |tx_out|
        addr = Bitcoin::Script.new(tx_out.pk_script).get_address
        if bitcoin_addresses.include? addr
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