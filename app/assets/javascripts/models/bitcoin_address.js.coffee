class BPS.Models.BitcoinAddress extends Backbone.Model
  paramRoot: 'bitcoin_address'
  urlRoot: '/bitcoin_addresses'

  defaults:
    description: "# Payment for\n\n\n# Your details – optional\nName:\n\n\n# Other details – optional\n"

class BPS.Collections.BitcoinAddressesCollection extends Backbone.Collection
  model: BPS.Models.BitcoinAddress
  url: '/bitcoin_addresses'
