class BPS.Models.Payment extends Backbone.Model
  paramRoot: 'payment'
  urlRoot: '/payments'

class BPS.Collections.PaymentsCollection extends Backbone.Collection
  model: BPS.Models.Payment
  url: '/payments'
