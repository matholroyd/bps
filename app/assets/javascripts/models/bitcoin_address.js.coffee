class BPS.Models.BitcoinAddress extends Backbone.Model
  paramRoot: 'bitcoin_address'
  urlRoot: '/bitcoin_addresses'

  defaults:
    address: null

class BPS.Collections.BitcoinAddressesCollection extends Backbone.Collection
  model: BPS.Models.BitcoinAddress
  url: '/bitcoin_addresses'
