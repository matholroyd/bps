class TransactionImporter
  class << self

    def refresh_for(bitcoin_addresses)
      addresses = bitcoin_addresses.collect do |ba|
        DBC.require(ba.valid?)
        ba.address
      end
      
      pull_transactions(addresses).each do |transaction|
        DBC.assert(transaction.save, transaction.errors)
      end
    end

    def pull_transactions(addresses)
      DBC.require(addresses)
      
      if addresses.count > 0
        extract_transactions Api::BlockExplorer.mytransactions(addresses), addresses 
      else
        []
      end
    end
    
    def pull_transaction(hash, addresses)
      DBC.require(hash)
      DBC.require(addresses)
      
      extract_transaction Api::BlockExplorer.rawtx(hash), addresses
    end
    
    def extract_transactions(json, addresses)
      DBC.require(json)
      DBC.require(addresses)

      json.collect do |k, transaction_json|
        extract_transaction transaction_json, addresses, json
      end
    end
    
    def extract_transaction(tx_hash, addresses, json = {})
      DBC.require(tx_hash)
      DBC.require(addresses)
      DBC.require(json)

      tx = Bitcoin::Protocol::Tx.from_hash(tx_hash)
      transaction = Transaction.find_or_create_by_bitcoin_tx_hash tx.hash
      transaction.binary = tx.to_payload

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
        amount = BigDecimal(tx_out.value.to_s) / BigDecimal((10**8).to_s)

        find_or_build_payment transaction, ba, amount
      end
    end
    
    def process_in(transaction, tx_in, addresses, json)
      node = json[tx_in.previous_output]['out'][tx_in.prev_out_index]

      addr = node['address'] || Bitcoin::Script.new(node['scriptPubKey']).get_address
      if addresses.include? addr
        ba = BitcoinAddress.find_or_create_by_address addr
        amount = -BigDecimal(node['value'])
      
        find_or_build_payment transaction, ba, amount
      end
    end
 
    def find_or_build_payment(transaction, ba, amount)
      if transaction.id.present? && ba.id.present?
        p = transaction.payments.find_by_bitcoin_address_id(ba.id)
        p.amount = amount
      else
        transaction.payments.build amount: amount, bitcoin_address: ba, transaction: transaction
      end
    end
 
  end
end