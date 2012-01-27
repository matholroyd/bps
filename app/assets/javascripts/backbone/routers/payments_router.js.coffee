class Bps.Routers.PaymentsRouter extends Backbone.Router
  initialize: (options) ->
    @user_full_name = options.user_full_name
    
  routes:
    "/new"      : "newPayment"
    ".*"        : "newPayment"

  newPayment: ->
    new Bps.Views.Payments.NewView(el: "#payments", user_full_name: @user_full_name).render()
