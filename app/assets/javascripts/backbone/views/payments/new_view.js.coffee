Bps.Views.Payments ||= {}

class Bps.Views.Payments.NewView extends Backbone.View
  template: JST["backbone/templates/payments/new"]

  events:
    "submit #new-payment": "save"

  constructor: (options) ->
    super(options)

    @user_full_name = options.user_full_name
    @model = new Bps.Models.Payment   
      
    @model.bind("change:errors", () =>
      this.render()
    )
  
  save: (e) ->
    e.preventDefault()
    e.stopPropagation()
  
  #   @model.unset("errors")
  # 
  #   @collection.create(@model.toJSON(),
  #     success: (payment) =>
  #       @model = payment
  #       window.location.hash = "/#{@model.id}"
  # 
  #     error: (post, jqXHR) =>
  #       @model.set({errors: $.parseJSON(jqXHR.responseText)})
  #   )

  render: ->
    hash = @model.toJSON()
    hash.user_full_name = @user_full_name
    $(@el).html(@template(hash))
    this.$("form").backboneLink(@model)
  
    return this
