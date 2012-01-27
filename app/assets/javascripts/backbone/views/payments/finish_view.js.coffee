Bps.Views.Payments ||= {}

class Bps.Views.Payments.FinishView extends Backbone.View
  template: JST["backbone/templates/payments/finish"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
