Bps.Views.Payments ||= {}

class Bps.Views.Payments.IndexView extends Backbone.View
  template: JST["backbone/templates/payments/index"]

  # events:
  #   "submit #new-post": "save"

  constructor: (options) ->
    super(options)
    # @model = new @collection.model()
    # 
    #   
    # @model.bind("change:errors", () =>
    #   this.render()
    # )
    @user_full_name = options.user_full_name
  
  save: (e) ->
    e.preventDefault()
    e.stopPropagation()
  
    @model.unset("errors")
  
    @collection.create(@model.toJSON(),
      success: (payment) =>
        @model = payment
        window.location.hash = "/#{@model.id}"
  
      error: (post, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    # $(@el).html(@template(@model.toJSON() ))
    $(@el).html(@template(user_full_name: @user_full_name))
  
    this.$("form").backboneLink(@model)
  
    return this
