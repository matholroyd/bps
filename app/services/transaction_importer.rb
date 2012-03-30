class TransactionImporter
  class << self

    def refresh_for(bitcoin_addresses)
      addresses = bitcoin_addresses.collect do |ba|
        DBC.require(ba.valid?)
        ba.address
      end

      transactions = import_for(addresses)
      process_payments_for transactions
    end

    def import_for(addresses)
      json = Api::BlockExplorer.mytransactions(addresses)
      json.collect do |tx_hash, tx_json|
        import tx_hash, tx_json
      end
    end
    
    def process_payments_for(transactions)
      addresses = BitcoinAddress.all.collect(&:address)
      transactions.each do |transaction|
        transaction.bitcoin_tx.in.each do |txin|
          process_in_tx transaction, txin, addresses
        end

        transaction.bitcoin_tx.out.each do |txout|
          process_out_tx transaction, txout, addresses
        end
      end
    end
    
    def import_and_process_tx(tx)
      transaction = import_tx tx
      TransactionImporter.process_payments_for [transaction]
    end
    
    private

    def import_tx(tx)
      tx = Bitcoin::Protocol::Tx.new(tx.to_payload)
      tx_hash = tx.hash
      tx_json = tx.to_hash
      import tx_hash, tx_json
    end
    
    def import(tx_hash, tx_json)
      begin
        Transaction.find_by_bitcoin_tx_hash!(tx_hash)
      rescue ActiveRecord::RecordNotFound
        tx = Bitcoin::Protocol::Tx.from_hash(tx_json)
        Transaction.create!(binary: tx.to_payload, bitcoin_tx_hash: tx_hash )
      end
    end
    
    
    def process_in_tx(transaction, txin, addresses)
      prev_transaction = Transaction.find_by_bitcoin_tx_hash(txin.previous_output)
      if prev_transaction
        prev_tx_out = prev_transaction.bitcoin_tx.out[txin.prev_out_index]
        addr = Bitcoin::Script.new(prev_tx_out.pk_script).get_address
        
        if addresses.include? addr
          ba = BitcoinAddress.find_by_address! addr
          amount = -BigDecimal(prev_tx_out.value.to_s) / Wallet::Offset
        
          find_or_create_payment transaction, ba, amount
        end
      end
    end
    
    def process_out_tx(transaction, txout, addresses)
      addr = Bitcoin::Script.new(txout.pk_script).get_address
      if addresses.include? addr
        ba = BitcoinAddress.find_by_address! addr
        amount = BigDecimal(txout.value.to_s) / Wallet::Offset
      
        find_or_create_payment transaction, ba, amount
      end
    end
 
    def find_or_create_payment(transaction, ba, amount)
      if transaction.payments.find_by_bitcoin_address_id(ba.id).nil?
        transaction.payments.create! amount: amount, bitcoin_address: ba, transaction: transaction
      end
    end
 
  end
end