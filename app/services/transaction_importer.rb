class TransactionImporter
  class << self

    def pull_transactions(bitcoin_addresses)
      DBC.require(bitcoin_addresses)
      
      []
    end
    
  end
end