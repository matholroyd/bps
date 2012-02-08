class BPS.Models.Payment extends Backbone.Model
  paramRoot: 'payment'
  urlRoot: '/payments'

  defaults:
    bitcoin_address: null
    description: null
    name: null
    email: null

class BPS.Collections.PaymentsCollection extends Backbone.Collection
  model: BPS.Models.Payment
  url: '/payments'
