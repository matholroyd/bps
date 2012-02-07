BPS.Views.Payments ||= {}

class BPS.Views.Payments.IndexView extends Backbone.View
  template: JST["backbone/templates/payments/index"]

  constructor: (options) ->
    super(options)
    @user_full_name = options.user_full_name

  render: ->
    $(@el).html(@template(user_full_name: @user_full_name))
  
    return this
