BPS.Views.BitcoinAddresses ||= {}

class BPS.Views.BitcoinAddresses.ShowView extends Backbone.View
  template: JST["templates/bitcoin_addresses/show"]

  render:  ->
    $(@el).html(@template(@model.toJSON()))
    return this
