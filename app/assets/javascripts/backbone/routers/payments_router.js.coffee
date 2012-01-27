class Bps.Routers.PaymentsRouter extends Backbone.Router
  initialize: (options) ->
    @user_full_name = options.user_full_name
    
  routes:
    "index"     : "index"
    "/new"      : "newPayment"
    ".*"        : "index"

  index: ->
    new Bps.Views.Payments.IndexView(el: "#payments", user_full_name: @user_full_name).render()

  newPayment: ->
    new Bps.Views.Payments.NewView(el: "#payments", user_full_name: @user_full_name).render()
