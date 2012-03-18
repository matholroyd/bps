class BPS.Models.BitcoinAddress extends Backbone.Model
  paramRoot: 'bitcoin_address'
  urlRoot: '/api/bitcoin_addresses'

  defaults:
    description: null

class BPS.Collections.BitcoinAddressesCollection extends Backbone.Collection
  model: BPS.Models.BitcoinAddress
  url: '/api/bitcoin_addresses'
