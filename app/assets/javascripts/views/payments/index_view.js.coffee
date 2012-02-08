BPS.Views.Payments ||= {}

class BPS.Views.Payments.IndexView extends Backbone.View
  template: JST["templates/payments/index"]

  render: (user_full_name) ->
    $(@el).html(@template(user_full_name: user_full_name))
  
    return this
