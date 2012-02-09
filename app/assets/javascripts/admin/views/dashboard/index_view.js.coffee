BPS.Admin.Views.Dashboard ||= {}

class BPS.Admin.Views.Dashboard.Index extends Backbone.View
  template: JST["admin/templates/dashboard/index"]

  events:
    'click #payments .show_details': 'show_payment_details'

  render: (payments) ->
    $(@el).html(@template(payments: payments))
   
    return this

  show_payment_details: (event) ->
    details = $(event.target).parent().children(".details")
    if details.attr("style") == "" || details.attr("style") == undefined
      details.css("height", "auto")
    else
      details.attr("style", "")
      
    
