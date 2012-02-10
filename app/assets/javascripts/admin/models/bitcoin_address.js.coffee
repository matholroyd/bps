class BPS.Admin.Models.BitcoinAddress extends Backbone.Model
  paramRoot: 'bitcoin_address'
  urlRoot: '/admin/bitcoin_addresses'

  defaults:
    description: null

class BPS.Admin.Collections.BitcoinAddressesCollection extends Backbone.Collection
  model: BPS.Admin.Models.BitcoinAddress
  url: '/admin/bitcoin_addresses'
