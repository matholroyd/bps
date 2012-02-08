BPS.Views.Payments ||= {}

class BPS.Views.Payments.ShowView extends Backbone.View
  template: JST["templates/payments/show"]

  render:  ->
    $(@el).html(@template(@model.toJSON()))
    return this
