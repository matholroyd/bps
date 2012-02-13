class TransactionImporter
  class << self

    def import_for(bitcoin_address)
      pull_transactions(bitcoin_address.address).each do |transaction|
        transaction.save!
      end
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
      tx = Bitcoin::Protocol::Tx.from_hash(tx_hash)
      transaction = Transaction.new binary: tx.to_payload

      tx.out.each do |tx_out|
        process_out transaction, tx_out, addresses
      end

      tx.in.select { |tx_in| json[tx_in.previous_output].present? }.each do |tx_in|
        process_in transaction, tx_in, addresses, json
      end
      
      transaction
    end
    
    private
    
    def process_out(transaction, tx_out, addresses)
      addr = Bitcoin::Script.new(tx_out.pk_script).get_address
      if addresses.include? addr
        ba = BitcoinAddress.find_or_create_by_address addr
        amount = BigDecimal(tx_out.value) / (10**8)
        transaction.payments.build amount: amount, bitcoin_address: ba, transaction: transaction
      end
    end
    
    def process_in(transaction, tx_in, addresses, json)
      node = json[tx_in.previous_output]['out'][tx_in.prev_out_index]

      addr = node['address'] || Bitcoin::Script.new(node['scriptPubKey']).get_address
      ba = BitcoinAddress.find_or_create_by_address addr
      amount = -BigDecimal(node['value'])
      
      transaction.payments.build amount: amount, bitcoin_address: ba, transaction: transaction
    end
 
  end
end