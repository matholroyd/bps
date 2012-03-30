class Wallet
  Offset = BigDecimal((10**8).to_s)

  class << self
    
    def balance
      Payment.sum(:amount)
    end
    
    def send_bitcoins(options)
      DBC.require(balance > 0, "Balance must be greater then 0")
      DBC.require(options[:to])
      DBC.require(options[:amount])
      DBC.require(options[:amount] > 0, "Must send amount greater then 0")
      DBC.require(options[:amount] <= balance, "Must send amount less than or equal to balance")

      tx = nil

      ActiveRecord::Base.transaction do
        tx = SendingBitcoins.create_tx(options)
        TransactionImporter.import_and_process_tx tx
      end
      Api::TransactionTransmitter.transmit(tx)
    end
        

  end
end