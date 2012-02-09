class BPS.Admin.Routers.Dashboard extends Backbone.Router
  initialize: ->
    @payments = new BPS.Admin.Collections.PaymentsCollection()
    @payments.reset []

  routes:
    "index"     : "index"
    ".*"        : "index"

  index: ->
    payments = @payments
    payments.fetch
      success: ->
        new BPS.Admin.Views.Dashboard.Index(el: "#admin").render(payments)
        
