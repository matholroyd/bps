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
          }',
          
          
          
          "https://blockexplorer.com/rawtx/c4bcb05690c97d89150f744958f821eeca380814235c2bbcd579893ce9109d09" =>
          '{
            "hash":"c4bcb05690c97d89150f744958f821eeca380814235c2bbcd579893ce9109d09",
            "ver":1,
            "vin_sz":1,
            "vout_sz":2,
            "lock_time":0,
            "size":257,
            "in":[
              {
                "prev_out":{
                  "hash":"73d22265e604529f204b2f2429a685c692323fdedd1318b70106cf2f45d1f72b",
                  "n":0
                },
                "scriptSig":"304402207a0a90b365a38c0722063d0105c5b1980b98f204ace972777f1eadb930eb1e4a02202818a837981724071adc4cf7ef9b9995f8a473d6c1772974e5fcfb85ab58259801 04a39b9e4fbd213ef24bb9be69de4a118dd0644082e47c01fd9159d38637b83fbcdc115a5d6e970586a012d1cfe3e3a8b1a3d04e763bdc5a071c0e827c0bd834a5"
              }
            ],
            "out":[
              {
                "value":"59.26760228",
                "scriptPubKey":"OP_DUP OP_HASH160 0568015a9facccfd09d70d409b6fc1a5546cecc6 OP_EQUALVERIFY OP_CHECKSIG"
              },
              {
                "value":"3.13320505",
                "scriptPubKey":"OP_DUP OP_HASH160 243ab5252340158c14e5328cea1286cc32992fa6 OP_EQUALVERIFY OP_CHECKSIG"
              }
            ]
          }',
          
          
          
          "https://blockexplorer.com/rawtx/1db5acf9dea096ffcbcb135627f2b3e4c7ba7be8d6432f872c225530d542c337" => 
          '{
            "hash":"1db5acf9dea096ffcbcb135627f2b3e4c7ba7be8d6432f872c225530d542c337",
            "ver":1,
            "vin_sz":1,
            "vout_sz":2,
            "lock_time":0,
            "size":258,
            "in":[
              {
                "prev_out":{
                  "hash":"6ea2014e3183bcb031a5a82b96823c6c8688a0bcd1a6669871e8fc690127a351",
                  "n":1
                },
                "scriptSig":"304502201eaeee01d94f54ff14e104121a65bd580a910d9cd1e03e41d0ebe02a1d3a436c0221008ae5e2efdee9c66f98a923f9525bfd7e1ced73ecdc75635655e225b1acf066fa01 04b6988b578c0eadf54ca96b6962aeed988934a357d0bc61d8981a0df732999cf453b8e649859a172f0cbda4864e80a2b878ba3370001da18144d029c34bbd302a"
              }
            ],
            "out":[
              {
                "value":"0.11830000",
                "scriptPubKey":"OP_DUP OP_HASH160 d4e49eb85b5a44c9d75416e93e005f1fa75c8e2c OP_EQUALVERIFY OP_CHECKSIG"
              },
              {
                "value":"11.00000000",
                "scriptPubKey":"OP_DUP OP_HASH160 a5e4654200e949ba580858821068d7e57d095cf4 OP_EQUALVERIFY OP_CHECKSIG"
              }
            ]
          }',
          
          
          
          "https://blockexplorer.com/q/mytransactions/1G8A6rRugWuqGpXpRKBip1DpVVUV9KtALK" => '{
            "1db5acf9dea096ffcbcb135627f2b3e4c7ba7be8d6432f872c225530d542c337":{
              "hash":"1db5acf9dea096ffcbcb135627f2b3e4c7ba7be8d6432f872c225530d542c337",
              "ver":1,
              "vin_sz":1,
              "vout_sz":2,
              "lock_time":0,
              "size":258,
              "in":[
                {
                  "prev_out":{
                    "hash":"6ea2014e3183bcb031a5a82b96823c6c8688a0bcd1a6669871e8fc690127a351",
                    "n":1
                  },
                  "scriptSig":"304502201eaeee01d94f54ff14e104121a65bd580a910d9cd1e03e41d0ebe02a1d3a436c0221008ae5e2efdee9c66f98a923f9525bfd7e1ced73ecdc75635655e225b1acf066fa01 04b6988b578c0eadf54ca96b6962aeed988934a357d0bc61d8981a0df732999cf453b8e649859a172f0cbda4864e80a2b878ba3370001da18144d029c34bbd302a",
                  "address":"13X27dvomi9rt76ZL7fU2VDkVk3zdDKTzv"
                }
              ],
              "out":[
                {
                  "value":"0.11830000",
                  "scriptPubKey":"OP_DUP OP_HASH160 d4e49eb85b5a44c9d75416e93e005f1fa75c8e2c OP_EQUALVERIFY OP_CHECKSIG",
                  "address":"1LQg8TvTbMzBEPBnxJG7Xtgna286NNMdgb"
                },
                {
                  "value":"11.00000000",
                  "scriptPubKey":"OP_DUP OP_HASH160 a5e4654200e949ba580858821068d7e57d095cf4 OP_EQUALVERIFY OP_CHECKSIG",
                  "address":"1G8A6rRugWuqGpXpRKBip1DpVVUV9KtALK"
                }
              ],
              "block":"0000000000000bd5462dff8b5c2df4b4d08a5542835de6af8cc15a86a8807e96",
              "blocknumber":"163114",
              "time":"2012-01-21 00:20:27"
            },
            "2173c496c19d004e4af7ba70213c973b5fe0101836219e822757ef1c612b2407":{
              "hash":"2173c496c19d004e4af7ba70213c973b5fe0101836219e822757ef1c612b2407",
              "ver":1,
              "vin_sz":1,
              "vout_sz":2,
              "lock_time":0,
              "size":258,
              "in":[
                {
                  "prev_out":{
                    "hash":"79ac5985576bc6b5f6fb25167717df1402fec106f84df69673053fd5f6ff0d42",
                    "n":0
                  },
                  "scriptSig":"304502205d115551029b0f24c20252efed5a52e3698ab3c2151c5e71be0d9a4748f1a07f0221008c9e05993d6a94e8aa5738eb39d09e416132bc874f60868ebac3bf34c00cef6301 049b79b97171b29119a245f39a0c15d33ddae9a563bf4548b0f4bf6e30618b6fec5531459d534e5918a66b0c44d8013634373ed3f801bc61de3ec2e2d277382712",
                  "address":"1JkLpVQbjq8mEAX2udR1SRMnQgHFiES7at"
                }
              ],
              "out":[
                {
                  "value":"0.68848224",
                  "scriptPubKey":"OP_DUP OP_HASH160 49f6b1877f9900d840508e92cf23d7c9a1463c28 OP_EQUALVERIFY OP_CHECKSIG",
                  "address":"17k5rZsHtXDyH7iNx9aGmX9xy7Yv4CYZtg"
                },
                {
                  "value":"2.00000000",
                  "scriptPubKey":"OP_DUP OP_HASH160 a5e4654200e949ba580858821068d7e57d095cf4 OP_EQUALVERIFY OP_CHECKSIG",
                  "address":"1G8A6rRugWuqGpXpRKBip1DpVVUV9KtALK"
                }
              ],
              "block":"000000000000007dc4ef8531b5a34303abacedd17b49071d6e7b44f2607e11b2",
              "blocknumber":"163120",
              "time":"2012-01-21 01:32:31"
            },
            "ae833d22090fce093203274f4ab028c50b8cb0d71e1fa62fd5d0032874bd6fbc":{
              "hash":"ae833d22090fce093203274f4ab028c50b8cb0d71e1fa62fd5d0032874bd6fbc",
              "ver":1,
              "vin_sz":1,
              "vout_sz":2,
              "lock_time":0,
              "size":257,
              "in":[
                {
                  "prev_out":{
                    "hash":"1db5acf9dea096ffcbcb135627f2b3e4c7ba7be8d6432f872c225530d542c337",
                    "n":1
                  },
                  "scriptSig":"30440220793534b58b80735be7d3ff6a610fec81308efbfeb188a48a4afc2b03223bb09902204ac5782dc9c96fe9d12668b51dc7dcc87b47257f584d43ebf12872ba34ed6e1f01 04e185f71aa6946ef4dafb7f47acb7e41f1aed5fe230a8ed1a9ce323277234b07f16555da108651baf58068425437fe38332dc9aab3b4a9e3e0f8677cdb08c945d",
                  "address":"1G8A6rRugWuqGpXpRKBip1DpVVUV9KtALK"
                }
              ],
              "out":[
                {
                  "value":"0.01950000",
                  "scriptPubKey":"OP_DUP OP_HASH160 3338b2dcc8ecbdefa9b9e0ba9a43c2af58674181 OP_EQUALVERIFY OP_CHECKSIG",
                  "address":"15fqPH49wjNeJzEw2huak4n2kEChTVDEoc"
                },
                {
                  "value":"10.98000000",
                  "scriptPubKey":"OP_DUP OP_HASH160 8df5ff53c465cf10ee2d7bd4ba2add313187545f OP_EQUALVERIFY OP_CHECKSIG",
                  "address":"1DwcyFDeHicGYr4QSi9idJJhmQY7zC2NPC"
                }
              ],
              "block":"00000000000005e1e527e38ae052e4118f53ad157ba1d98f2b230832274e7a51",
              "blocknumber":"163124",
              "time":"2012-01-21 02:26:28"
            },
            "943d403984bf9756b92e12f607f9a3409b70b9b69ddcb2fe6c84119ed7dbe1e1":{
              "hash":"943d403984bf9756b92e12f607f9a3409b70b9b69ddcb2fe6c84119ed7dbe1e1",
              "ver":1,
              "vin_sz":1,
              "vout_sz":2,
              "lock_time":0,
              "size":257,
              "in":[
                {
                  "prev_out":{
                    "hash":"2173c496c19d004e4af7ba70213c973b5fe0101836219e822757ef1c612b2407",
                    "n":1
                  },
                  "scriptSig":"3044022035c88c9c5fae162e65c767e44759ebfb0d4d54a6a033b172b078287e922acaef02207b6bca85ffdbb533b3c47652e86736c778b070ac7aa1f8c6814881904d2e14d701 04e185f71aa6946ef4dafb7f47acb7e41f1aed5fe230a8ed1a9ce323277234b07f16555da108651baf58068425437fe38332dc9aab3b4a9e3e0f8677cdb08c945d",
                  "address":"1G8A6rRugWuqGpXpRKBip1DpVVUV9KtALK"
                }
              ],
              "out":[
                {
                  "value":"0.01950000",
                  "scriptPubKey":"OP_DUP OP_HASH160 9dc78041fe993e923bb0d123a39f66562fbcc38d OP_EQUALVERIFY OP_CHECKSIG",
                  "address":"1FPG5h3LuGNZc5vNq67GEYDEmGqupmFqXE"
                },
                {
                  "value":"1.98000000",
                  "scriptPubKey":"OP_DUP OP_HASH160 8df5ff53c465cf10ee2d7bd4ba2add313187545f OP_EQUALVERIFY OP_CHECKSIG",
                  "address":"1DwcyFDeHicGYr4QSi9idJJhmQY7zC2NPC"
                }
              ],
              "block":"00000000000008a133d516889ce4cd3a89b8ef5a61b9ed761728ef6ececce246",
              "blocknumber":"163130",
              "time":"2012-01-21 03:33:41"
            },
            "5e46300ccc45f79f3ab734b3015ee2c52b989c27e81575fa9661c9d76f1c9bdf":{
              "hash":"5e46300ccc45f79f3ab734b3015ee2c52b989c27e81575fa9661c9d76f1c9bdf",
              "ver":1,
              "vin_sz":1,
              "vout_sz":2,
              "lock_time":0,
              "size":259,
              "in":[
                {
                  "prev_out":{
                    "hash":"ac757324888eb589712b2ac2cc1ce91cdf84ca89ee6bede62b3702c6ca8e4754",
                    "n":0
                  },
                  "scriptSig":"3046022100f58dfc65f3a89a724b4f005a84bcde25b1f50703eed8b0a5aa67292552f766aa022100ab3752507048f923ada7bc167a91fbb7b6ba8eba0eff554ec4ab97a2e046de9701 04a2efa5b2b750bbe556dfead7f7f518bab654bca64578cb5a97d6ebfb8e8e311bce3ac15060400171f8a74c20481025b344ada12baf0a03590402e7c338f22308",
                  "address":"12tLvw4zeDg7Dv4Q1xVJQtC74ioi3wicKM"
                }
              ],
              "out":[
                {
                  "value":"11.25737942",
                  "scriptPubKey":"OP_DUP OP_HASH160 6e846ff5be2553ec9e0431d046dbf6fea18c592d OP_EQUALVERIFY OP_CHECKSIG",
                  "address":"1B5Mz1YFxtQDui3zRhwCkMqZEuQpXwQDRh"
                },
                {
                  "value":"0.00117830",
                  "scriptPubKey":"OP_DUP OP_HASH160 a5e4654200e949ba580858821068d7e57d095cf4 OP_EQUALVERIFY OP_CHECKSIG",
                  "address":"1G8A6rRugWuqGpXpRKBip1DpVVUV9KtALK"
                }
              ],
              "block":"000000000000081ce69f5df5abf00599e5d7eff561188be7c947f7f75c868552",
              "blocknumber":"163157",
              "time":"2012-01-21 07:30:53"
            },
            "3d54126c43465b81a37a938310676795370b5502293a53679a0fcfecddeb11f8":{
              "hash":"3d54126c43465b81a37a938310676795370b5502293a53679a0fcfecddeb11f8",
              "ver":1,
              "vin_sz":9,
              "vout_sz":2,
              "lock_time":0,
              "size":1697,
              "in":[
                {
                  "prev_out":{
                    "hash":"6f7d7c799cc6e9a3f4f3aefa11304ef097a5590d41e83b26ed7289b345daebf6",
                    "n":1
                  },
                  "scriptSig":"304402202aade71df5de3237c271b26085d19e1acf12b0b085c9735278e94960ecaa86e902201ebd2b28b136ed30cd39cd41769af58de40c20bfd1b4472a5be862af6a588a3b01 0455a0a0d907d784daa14a095a344f95730e4fdd542d7fe6615d9898393b3116b48ef3f810adce7f0c17b8f5f089a7b564cf92d6e57478442fefede2c6bc58c8f6",
                  "address":"1QDccngnpZojEWf1BLismByFGmp4vd6iPF"
                },
                {
                  "prev_out":{
                    "hash":"93a1830c9bc00ce1c926822a2aa4e8eda78e7f4b86bd983256ac5dcb42e40be7",
                    "n":11
                  },
                  "scriptSig":"3046022100c545be3218aba427cb9f7120e38aeee8417f419c7c414766f31fa1acf573b973022100ac0f14e073e9a9d2063ddd835380b362f900718a7a15bb9344d5d4132c5ccbbc01 04440729f76479bf9bd209ca08d1bb24732d0d0e6bc1caece93996d035f39a2409b1c319c6932c9fe6e6f79c979cec862bd73c72737af27bf1bfeadd3ec23502ed",
                  "address":"16hY94VqA9ykRhqjcLQh4Fd4SxJzW4BA8V"
                },
                {
                  "prev_out":{
                    "hash":"cfaf77114caaf4d0c54a94203d291464ae6904d97361c576aae41281473dd34d",
                    "n":1
                  },
                  "scriptSig":"304502202de150c51b918ba9cefc92bb0c9e7e012127ddccf627a939c4b0a65e6b9f4d29022100fb9c2df453b709517fbd551a1e105837b6a7455c68bd19de7a96c0834bb8feaf01 04567f489a1df0d8f799b7cbff45f825d6b7c166eefde366e13ca1c91fe232785d9f8f18bf7e708e72fd1ad60c94a6b8f864bf21c32782e515f4dc4f7199265105",
                  "address":"1MdFwbYoXx4YJid8CX1ZRwHnGeHt9qzbRe"
                },
                {
                  "prev_out":{
                    "hash":"70cd1954554e5492914fbe91b7238f58f738350bfdb6433671439b7789cd8402",
                    "n":1
                  },
                  "scriptSig":"304502202b48d4251adb519920982650c1e2fef7a7f539c8626638e745cadee829a906ff022100f34126bc6112dba42302328912881b9ba143bf9aa2d33a270d1ef6247caa609801 04290bac4f7319549626d4bda367a135f1893dce69b3356509e7def5dc0059d81bcb9a778aee43c6130f698adba9759cfefd516357f6d0fdb6b14a33dba397ad9a",
                  "address":"1B2439q1PadGiQALArDXFUL1i4qWAirTqQ"
                },
                {
                  "prev_out":{
                    "hash":"96650824b44b20dfbaadd151aebcaf9e1916ac4e797a4d96e0d8e11b0ed25954",
                    "n":0
                  },
                  "scriptSig":"304502210089ef53c38ea1961e8616fb5cfc30167b6723c4361d5eee38beef6f4d648553c1022063d0945cad79f063c3283034a851678418445ceac8b63e117c4eee1b8c294d9b01 04b38c7cdd781c7dd8017c6a0103ccf9c6f7476114a03b12bfc951d9d17373d4473f54ea5dd088a59bea422fba959a6870dc52337e34d4378a714b4f839b5947c7",
                  "address":"1KSCX1KWc2UcMYzS8UmaKJmXLRpGsZGo1H"
                },
                {
                  "prev_out":{
                    "hash":"84971ba3ca13ce256fddfd2de2a098371d4b609f87b68fa1c98690849faaf543",
                    "n":1
                  },
                  "scriptSig":"304502210088f478e73917ebce536c9f1dc134edeb906290ab592f7418256b7e5eedf065e8022049b5519275f48b4ab81e7bef3b9744430c5f531c03af2ca2b95c6455426901aa01 0455a0a0d907d784daa14a095a344f95730e4fdd542d7fe6615d9898393b3116b48ef3f810adce7f0c17b8f5f089a7b564cf92d6e57478442fefede2c6bc58c8f6",
                  "address":"1QDccngnpZojEWf1BLismByFGmp4vd6iPF"
                },
                {
                  "prev_out":{
                    "hash":"806dbd355881f4b89108846c728559598eac1b8746ac6a12976c7b75eb9a0355",
                    "n":0
                  },
                  "scriptSig":"3045022100e5e71a9e3e76923ce37337b6aa4d91aa64499a6503c6803deb099011dee4aa520220323867e4b6ec708f3d3e7fda85d9a57f8799202ba48f56b9d2d996a1bcd57f7b01 04964f4fadf6c2a06feafaf400bd54d713972fd665f1282d9bb2c6b370cd3ec8de51c7c4cf091e67a3b0a3ed85005f5d9766f82036d326076ca9d779eb13a7110f",
                  "address":"12eRa1DCqwA6dDDCTtY49aSRjKn2SnAVwC"
                },
                {
                  "prev_out":{
                    "hash":"5e46300ccc45f79f3ab734b3015ee2c52b989c27e81575fa9661c9d76f1c9bdf",
                    "n":1
                  },
                  "scriptSig":"3044022063f1086fadb384af60a1bfa0d488c77aa033536c8b66f2e434735a0c3c969979022005eb7f88f9a7978d6789fe9e8003b184017603de67cba489d3991451561b74c901 04e185f71aa6946ef4dafb7f47acb7e41f1aed5fe230a8ed1a9ce323277234b07f16555da108651baf58068425437fe38332dc9aab3b4a9e3e0f8677cdb08c945d",
                  "address":"1G8A6rRugWuqGpXpRKBip1DpVVUV9KtALK"
                },
                {
                  "prev_out":{
                    "hash":"d916362e6123c5da41feca021df320b78d6bdedf6e892e1f41057fad29869047",
                    "n":1
                  },
                  "scriptSig":"3045022020de84a047b3746b9e9296911a4e01246d0b4ff8f75f4fa562fff5270d5053be022100d226a1601f9711492bdd3d78473804ec5abacd041e9813c7aa39d61ab647877e01 0455a0a0d907d784daa14a095a344f95730e4fdd542d7fe6615d9898393b3116b48ef3f810adce7f0c17b8f5f089a7b564cf92d6e57478442fefede2c6bc58c8f6",
                  "address":"1QDccngnpZojEWf1BLismByFGmp4vd6iPF"
                }
              ],
              "out":[
                {
                  "value":"0.01008538",
                  "scriptPubKey":"OP_DUP OP_HASH160 bf7a36b5a9a3a5438b34fdd59316a6ff2811ca14 OP_EQUALVERIFY OP_CHECKSIG",
                  "address":"1JTSUCRjzZjCSeReDWuLQP6KNtLSdg5gEh"
                },
                {
                  "value":"5.98000000",
                  "scriptPubKey":"OP_DUP OP_HASH160 ab28573b112d9e5d06c0d4c0b964d0ae01855b82 OP_EQUALVERIFY OP_CHECKSIG",
                  "address":"1GbzsjAz5eRNpsRsz48E2oemGfv4v4yc3f"
                }
              ],
              "block":"00000000000006aa07280aa193780341c6b7b89202489a62f0b713dc168a7586",
              "blocknumber":"163221",
              "time":"2012-01-21 15:36:57"
            },
            "9af5d906857a393b3c09c010b0d1c71f07feeec1a06e7dcb73929669f58f2ac2":{
              "hash":"9af5d906857a393b3c09c010b0d1c71f07feeec1a06e7dcb73929669f58f2ac2",
              "ver":1,
              "vin_sz":1,
              "vout_sz":2,
              "lock_time":0,
              "size":257,
              "in":[
                {
                  "prev_out":{
                    "hash":"67eb06a2afb87f1bad05667b926a29978587e6792fe7764e014f734f4e646d29",
                    "n":1
                  },
                  "scriptSig":"3044022069743176c9df5d0f3a05c5b2e73095d23821bbbb076820b37edace69d0107a1602206a8eee59046cc2aa3217edb7a6ed39a0b71d80df9986c4bd28f73e1f22afdf3c01 047f30ade4f526557dd7159e200ca74f3dcf955aec152632bdf3c391faef262de25694a4213ecd25514faecf80ee09d265fa34456749d506d4ca92ec7b04fc5a90",
                  "address":"1G4VGBqSN5LE924xppiDJwWpCHa4CiMEo1"
                }
              ],
              "out":[
                {
                  "value":"0.09747000",
                  "scriptPubKey":"OP_DUP OP_HASH160 7b55b7b43d550859b071a8b0a82a58870f8112e7 OP_EQUALVERIFY OP_CHECKSIG",
                  "address":"1CF8oMmFrv7o5xnwuFqRdTMtQeUVjb4a3W"
                },
                {
                  "value":"5.86519000",
                  "scriptPubKey":"OP_DUP OP_HASH160 a5e4654200e949ba580858821068d7e57d095cf4 OP_EQUALVERIFY OP_CHECKSIG",
                  "address":"1G8A6rRugWuqGpXpRKBip1DpVVUV9KtALK"
                }
              ],
              "block":"0000000000000721b248eaa1bfef87a4e241d1f81d9cd64399e609f251549b79",
              "blocknumber":"165636",
              "time":"2012-02-06 15:31:18"
            },
            "c3aafdf7602df7c08539ee95d8a9e8eb1581003e80815e2cd9a02fe3a550f9c4":{
              "hash":"c3aafdf7602df7c08539ee95d8a9e8eb1581003e80815e2cd9a02fe3a550f9c4",
              "ver":1,
              "vin_sz":7,
              "vout_sz":2,
              "lock_time":0,
              "size":1338,
              "in":[
                {
                  "prev_out":{
                    "hash":"dcc37cb9c46dcaecb72970e129928be68eb0842b43e9e2ef1e405d2ed42767a6",
                    "n":0
                  },
                  "scriptSig":"3046022100ad3328d62e189157d358394d61f62be7950bee2a9b2e87ca5b68640a84c78bab022100f7976082a05c4508798af61cb1733518ea906d7b928015fbc2278a7cd1e7370b01 045623395581202a0b7acb372649b77f94fff4b6b61ae570731c955d9e75270ef553da8606eae5fd8a051fd6b3d2db725981eff9a35422ceaf022d49255895ae27",
                  "address":"17re3FReuX3ZxsnpyERG4939FqmBNRcsZs"
                },
                {
                  "prev_out":{
                    "hash":"da2af055e96a7e76ea15f18a7c03aeb34df9fa26a1e9305b16b2d4f9dfcf2bc8",
                    "n":1
                  },
                  "scriptSig":"3045022100d86162dd1899c50d0489d202a51e3fb95f9de179d9433b4fb06e972da313b5c902203bcf98b16b2faa8fe21f39640e7de811620ea8dfd9c6a93af884d9832ecf4a2d01 04279a2d1714684d553dcdce6bd4112c25ff9de12c9d790bbfe2d87895ba33a520aebfeb1d4bacba0612231f95075214d8479bfb8b4a2f22fa65f36ed280ad55a4",
                  "address":"17QAhWZGUJ1ZtLLFwrUC6eQU19h9M3NupR"
                },
                {
                  "prev_out":{
                    "hash":"1b7b401690b22a979c6cc57a12879bcc32ae4abf4bf076eb0a7926449f843be1",
                    "n":0
                  },
                  "scriptSig":"3044022031eb83bba7081d095d5abc4cc3da6a9a3c47fe827caf617a50c99db08425c23a022011ab69bb38fa6b62b6a6af5892cd7df6427a2e5b866a89c82d757665115fdd5001 04e619136589cbfe1f2d068d574467d2c634594c621ae961a31935c728ae02c2771fa533e439c623c54d73d811c13716b7218ef78e5506381fe418490ac22a9660",
                  "address":"1Mq3gREsP6bj7VvfFahm8AvLqkun1YqJQo"
                },
                {
                  "prev_out":{
                    "hash":"34aafe39c9e7ed2c1079407f9243bd4c550030d023483fceeaa06b7716dd0c9b",
                    "n":1
                  },
                  "scriptSig":"3045022100fb451266710fd3ed514d153286b7dab8e6b599cca003eb4b8b3ab763ee4efa9f022015262fda27b249fed425e32bcb66eb9791aa1ffc4cdee6a71103264bc4be020c01 04c55888e3f3b9709ce424887ef5a4daa670c8eea86a1c1c4088cf0766e147f6f1b0c9789896dbb5f365d6943fb2731317efa3cf3bfa6b1229e40bd326244c94bc",
                  "address":"1JL4jRntpWVbUBpymFv1tciBVURmG11C7Y"
                },
                {
                  "prev_out":{
                    "hash":"9af5d906857a393b3c09c010b0d1c71f07feeec1a06e7dcb73929669f58f2ac2",
                    "n":1
                  },
                  "scriptSig":"3045022100cf5a1ac2d1a9b38063f11053e56af3183a64ec333a7093983dd9dcde69fd848a022074180b09373375542f33590d30d4eb9206faa098fc4442da8c178a918f23305501 04e185f71aa6946ef4dafb7f47acb7e41f1aed5fe230a8ed1a9ce323277234b07f16555da108651baf58068425437fe38332dc9aab3b4a9e3e0f8677cdb08c945d",
                  "address":"1G8A6rRugWuqGpXpRKBip1DpVVUV9KtALK"
                },
                {
                  "prev_out":{
                    "hash":"e0d13149cd37f3415e03c7a13b489e5ed5a8af9629d46b2d2cdafbddea585454",
                    "n":1
                  },
                  "scriptSig":"30450221009185d016f73f10967880897522f199c72b569ccdc2cb516836a4dc918a4d1bb1022005384cbf2893de428f7bbeb32fea1c66d4a88202c43bb1f797cefd3053a01c4a01 045050f32424f7d93544bbe46d04814199ea175645d368791d386f6122ad235aedd99a1e196b70621d849ac25753944c7930f655ef68f496446ed6d9ed30223eaf",
                  "address":"19Dx255mqXwm5vDtBYHVKoiqUJwRqX8aD6"
                },
                {
                  "prev_out":{
                    "hash":"4894959bc51e6cd4ce92bcddd2c61aea7074dacfa19f6bc371944df4a4acddc1",
                    "n":0
                  },
                  "scriptSig":"30450221008f11c5fb02426a666380075e62ce00ca1d1c80bd3b51601fee31c8504c877d9902206ff54b12f5be00fcb913ac73ddcec4f7715db57cb45d94cce1734a550984c35901 043cf3ecb0606a5760ef72a48a024ae60e8ecfa4791e495202c404c7985ae3a0466a83a2c496715c1ebac61b0a2961b9a9b474f15d5611fd6fdbe42a5306b4728b",
                  "address":"1JzmKz4z4LEiKktxDvAgVnP4MAeWe41n6t"
                }
              ],
              "out":[
                {
                  "value":"0.03561313",
                  "scriptPubKey":"OP_DUP OP_HASH160 8685092618728557d6905183bacfd7ac462491a6 OP_EQUALVERIFY OP_CHECKSIG",
                  "address":"1DGGvC3QRk3dnvqMLBz4n2YXhrhddT9SkA"
                },
                {
                  "value":"19.98000000",
                  "scriptPubKey":"OP_DUP OP_HASH160 db4370df7bc25e9b073948a6929e7ce32d40c91e OP_EQUALVERIFY OP_CHECKSIG",
                  "address":"1LzMmtUMuXbAAH41JjX8rBwpB7czQpMCKZ"
                }
              ],
              "block":"00000000000008304a42e8d6e6d25fc4343fe750578a123cd29b7f831fce0e57",
              "blocknumber":"165645",
              "time":"2012-02-06 17:01:31"
            },
            "273ed31f069cef480a63fd5e9776738dc42628a31a6727013b12fe056b0e97f6":{
              "hash":"273ed31f069cef480a63fd5e9776738dc42628a31a6727013b12fe056b0e97f6",
              "ver":1,
              "vin_sz":1,
              "vout_sz":2,
              "lock_time":0,
              "size":258,
              "in":[
                {
                  "prev_out":{
                    "hash":"49ec772f15dbbe64034dcaae0fbb9dbe594f906cef2f821f49b34477a9041ceb",
                    "n":1
                  },
                  "scriptSig":"3045022026f7aac2574e31ca86325e1bdcd7e1e82cd9239c7e9e7338f437514a20343244022100a9348aaa01d2f2b242213a641e22f24fc253f5cf67afcebb891bf5f5543eb8fd01 04bcc9b4c984b816f8476268975f2ea8de57e9f56d1a053d96e2aa04c584722519be6cbc6d5c6c8f282d29e1cbae73f018c120ad1b50f533d1b1a7b779d655df91",
                  "address":"14GV5P8BwboQni6WmhUpu7x3eiVh7ibjGR"
                }
              ],
              "out":[
                {
                  "value":"5.56955000",
                  "scriptPubKey":"OP_DUP OP_HASH160 522440f66549567ac6ba001a31a3dcf912c1620e OP_EQUALVERIFY OP_CHECKSIG",
                  "address":"18VKqgkx6Uoo9FnF8Q8DtAh8vkipNajHsT"
                },
                {
                  "value":"5.43045000",
                  "scriptPubKey":"OP_DUP OP_HASH160 a5e4654200e949ba580858821068d7e57d095cf4 OP_EQUALVERIFY OP_CHECKSIG",
                  "address":"1G8A6rRugWuqGpXpRKBip1DpVVUV9KtALK"
                }
              ],
              "block":"0000000000000191727bf698eb07f68204cc1d6f1d9d0f74527d5c27f0675aea",
              "blocknumber":"166580",
              "time":"2012-02-13 03:25:10"
            }
          }',
          
          'https://blockexplorer.com/q/mytransactions/12LDktNb5cmANNmXzhCZfRkN8j8MqsBgts' => '{
            
          }'
          
        }
   
        DBC.ensure(hash[url] != nil, "No dummy data for '#{url}")
        hash[url]
      end
      
    end
  end
end