module BitcoinHelpers
  def public_key(bitcoin_address)
    BitcoinAddress.find_by_address(bitcoin_address).public_key
  end
  
  def private_key(bitcoin_address)
    BitcoinAddress.find_by_address(bitcoin_address).private_key
  end
  
  def send_bitcoins(options)
    DBC.require(options[:to])
    DBC.require(options[:amount])
    
    ba = BitcoinAddress.find_by_address options[:to]
    
    Payment.make amount: options[:amount],  bitcoin_address: ba
  end

  class Data
    class << self
      def transaction_json_1
<<-TEXT
{
  "21dd59c14dc771550b78dbfb3fd57386ad21bb02ad8c8989c7e6bbd8a2e85418":{
    "hash":"21dd59c14dc771550b78dbfb3fd57386ad21bb02ad8c8989c7e6bbd8a2e85418",
    "ver":1,
    "vin_sz":1,
    "vout_sz":1,
    "lock_time":0,
    "size":223,
    "in":[
      {
        "prev_out":{
          "hash":"6c5067ee83752022110fafefefcbbba9f006c2c90bce0d7cba4c28258831e0af",
          "n":1
        },
        "scriptSig":"3044022072f51b80086021ed330cf933b6470546e51497d3543d80673eb0f89bd4b0ca330220157535d1507ddd085501b8f1c9ade8125f425380438fef8d2831cbc2ddd13c0201 04923c2ff44fc75eb907ff6743c9463fa8f6be97388a2e4244b7c3baa7f80b2f6b03d08276ddc10f5b389521fe59729e1b6ceaa3aa5f5c67d2b589a5108e62c684",
        "address":"1JDfUiJHZ6pDY6wWYTx86RYjDCW7QxCofs"
      }
    ],
    "out":[
      {
        "value":"0.10000000",
        "scriptPubKey":"OP_DUP OP_HASH160 97d689504e753306d5522574572b59a329031cc9 OP_EQUALVERIFY OP_CHECKSIG",
        "address":"1Eqr3DVzC1c2n85WkffznhXTp2dmUY6RLm"
      }
    ],
    "block":"00000000000004e0e2245a428d80ba7ad3f50a4bf01c78eb11fc8539151d7b9b",
    "blocknumber":"166328",
    "time":"2012-02-11 12:55:43"
  }
}
TEXT
      end
    end
  end
end

RSpec.configuration.include BitcoinHelpers