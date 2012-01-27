class Bps.Models.Payment extends Backbone.Model
  paramRoot: 'payment'

  defaults:
    bitcoin_address: null
    description: "something"
    name: "fsdfas"

class Bps.Collections.PaymentsCollection extends Backbone.Collection
  model: Bps.Models.Payment
  url: '/payments'
