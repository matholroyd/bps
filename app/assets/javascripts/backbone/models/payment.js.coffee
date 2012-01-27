class Bps.Models.Payment extends Backbone.Model
  paramRoot: 'payment'

  defaults:
    bitcoin_address: null
    description: null
    name: null
    email: null

class Bps.Collections.PaymentsCollection extends Backbone.Collection
  model: Bps.Models.Payment
  url: '/payments'
