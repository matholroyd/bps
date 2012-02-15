require 'open-uri'

module Api
  
  class BlockExplorer
    Domain = "https://blockexplorer.com"
    MyTransactions = "#{Domain}/q/mytransactions"
    RawTx = "#{Domain}/rawtx"
    
    class << self
      
      def mytransactions(addresses)
        get_json "#{MyTransactions}/#{addresses.join('.')}"
      end

      def rawtx(hash)
        get_json "#{RawTx}/#{hash}"
      end
      
      private 
      
      def get_json(url)
        if Rails.env.test?
          JSON.parse DummyData::BlockExplorer.get(url)
        else
          JSON.parse open(url).read
        end
      end
      
    end
  end
end