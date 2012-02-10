BPS.Views.BitcoinAddresses ||= {}

class BPS.Views.BitcoinAddresses.IndexView extends Backbone.View
  template: JST["templates/bitcoin_addresses/index"]

  render: (user_full_name) ->
    $(@el).html(@template(user_full_name: user_full_name))
  
    return this
