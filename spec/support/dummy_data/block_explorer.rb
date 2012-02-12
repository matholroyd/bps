module DummyData
  class BlockExplorer
    class << self
      
      def get(url)
        hash = {
          "https://blockexplorer.com/q/mytransactions/1BDnQ3UCwTTkL4jKLZabaiu9qd9566kJKf" => 
          '{

          }',
          
          "https://blockexplorer.com/q/mytransactions/1JDfUiJHZ6pDY6wWYTx86RYjDCW7QxCofs" => 
          '{
            "6c5067ee83752022110fafefefcbbba9f006c2c90bce0d7cba4c28258831e0af":{
              "hash":"6c5067ee83752022110fafefefcbbba9f006c2c90bce0d7cba4c28258831e0af",
              "ver":1,
              "vin_sz":1,
              "vout_sz":2,
              "lock_time":0,
              "size":257,
              "in":[
                {
                  "prev_out":{
                    "hash":"d52cfc7d0786e3ceb7af6d2bb2e5d02a80a48651f4c2e9295f360ed3bf6c9489",
                    "n":1
                  },
                  "scriptSig":"30440220230ab2bead38e30d06cc631474e83c09d97c82a8c47538456b91d8c69bcb869b0220257cf84f920adad1e9bbbc0a5456c3010bdcfdcee1d128187d4e0ad3d90c8b6001 04923246220dbf3be96e3eefdc529c90100ce4c44c6f64f8ac3a6aae33ff0702918569f6b01cfe77a058ec4f56ef118d24791da792604f17ecddbeec342985d174",
                  "address":"1McjPsUHS7ifNwSnRDrvKud7h3o4aCs5Pu"
                }
              ],
              "out":[
                {
                  "value":"0.16200000",
                  "scriptPubKey":"OP_DUP OP_HASH160 ae2cb4549afa541f1cac338aa4c380ef2595fc4c OP_EQUALVERIFY OP_CHECKSIG",
                  "address":"1Gsx8VkmTnJ9sWM7Z1PiCyCBd3KCWRmd9t"
                },
                {
                  "value":"0.10000000",
                  "scriptPubKey":"OP_DUP OP_HASH160 bcdf3fdfe8e660cb1c9b17a4da6af31da584ce03 OP_EQUALVERIFY OP_CHECKSIG",
                  "address":"1JDfUiJHZ6pDY6wWYTx86RYjDCW7QxCofs"
                }
              ],
              "block":"0000000000000756dd7a215636aa59375c692afe83631d18010a7a4a3446baa2",
              "blocknumber":"161186",
              "time":"2012-01-08 04:55:28"
            },
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
          }'
          
        }
   
        DBC.ensure(hash[url] != nil, "No dummy data for '#{url}")
        hash[url]
      end
      
    end
  end
end