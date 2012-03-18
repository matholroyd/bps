BPS.Views.BitcoinAddresses ||= {}

class BPS.Views.BitcoinAddresses.ShowView extends Backbone.View
  template: JST["templates/bitcoin_addresses/show"]

  render:  ->
    data = _.extend(@model.toJSON(), {qrcode: create_qrcode(@model.get('address'))})
    $(@el).html(@template(data))
    return this
