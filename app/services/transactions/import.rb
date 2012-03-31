module Transactions
  class Import
    class << self
      def from_blockexplorer(addresses)
        json = Api::BlockExplorer.mytransactions(addresses)
        json.collect do |tx_hash, tx_json|
          create_transaction tx_hash, tx_json
        end
      end

      def from_tx(tx)
        tx = Bitcoin::Protocol::Tx.new(tx.to_payload)
        tx_hash = tx.hash
        tx_json = tx.to_hash
        create_transaction tx_hash, tx_json
      end
      
      private

      def create_transaction(tx_hash, tx_json)
        begin
          Transaction.find_by_bitcoin_tx_hash!(tx_hash)
        rescue ActiveRecord::RecordNotFound
          tx = Bitcoin::Protocol::Tx.from_hash(tx_json)
          Transaction.create!(binary: tx.to_payload, bitcoin_tx_hash: tx_hash )
        end
      end
      
    end
  end
end