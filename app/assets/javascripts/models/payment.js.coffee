class BPS.Models.Payment extends Backbone.Model
  paramRoot: 'payment'
  urlRoot: '/payments'

  defaults:
    bitcoin_address: null
    description: "# Payment for\n\n\n# Your details – optional\nName:\n\n\n# Other details – optional\n"

class BPS.Collections.PaymentsCollection extends Backbone.Collection
  model: BPS.Models.Payment
  url: '/payments'
