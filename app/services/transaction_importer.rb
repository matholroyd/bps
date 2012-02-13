class TransactionImporter
  class << self

    def pull_transactions(bitcoin_addresses)
      DBC.require(*bitcoin_addresses)
      
      json = Api::BlockExplorer.mytransactions bitcoin_addresses

      json.collect do |k, hash_data|
        tx = Transaction.new
        # build_payments tx, :in,   hash_data, bitcoin_addresses
        build_payments tx, :out,  hash_data, bitcoin_addresses
        tx
      end
    end
    
    private
    
    def build_payments(tx, direction, hash, bitcoin_addresses)
      hash[direction.to_s].select {|p| bitcoin_addresses.include? p['address'] }.collect do |p|
        if direction == :out
          tx.payments.build amount: BigDecimal(p['value'])
        else
          # tx.payments.build amount: -BigDecimal(p['value'])
        end
      end
    end
    
  end
end