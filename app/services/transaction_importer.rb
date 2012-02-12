class TransactionImporter
  class << self

    def pull_transactions(bitcoin_addresses)
      DBC.require(*bitcoin_addresses)
      
      json = Api::BlockExplorer.mytransactions bitcoin_addresses

      json.inject([]) do |results, hash|
        hash
      end
    end
    
  end
end