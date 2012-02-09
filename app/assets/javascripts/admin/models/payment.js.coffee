class BPS.Admin.Models.Payment extends Backbone.Model
  paramRoot: 'payment'
  urlRoot: '/admin/payments'

  defaults:
    bitcoin_address: null
    description: null
    name: null
    email: null

class BPS.Admin.Collections.PaymentsCollection extends Backbone.Collection
  model: BPS.Admin.Models.Payment
  url: '/admin/payments'
