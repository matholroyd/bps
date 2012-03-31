class TransactionImporter
  class << self

    def refresh_for(bitcoin_addresses)
      addresses = bitcoin_addresses.collect(&:address)

      transactions = Transactions::Import.from_blockexplorer addresses
      Transactions::ProcessPayments.for transactions
    end
    
    def import_and_process_tx(tx)
      transaction = Transactions::Import.from_tx tx
      Transactions::ProcessPayments.for [transaction]
    end
 
  end
end