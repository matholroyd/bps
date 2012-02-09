BPS.Admin.Views.Dashboard ||= {}

class BPS.Admin.Views.Dashboard.Index extends Backbone.View
  template: JST["admin/templates/dashboard/index"]

  render: (payments) ->
    $(@el).html(@template(payments: payments))
   
    return this
