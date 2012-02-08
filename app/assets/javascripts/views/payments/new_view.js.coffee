BPS.Views.Payments ||= {}

class BPS.Views.Payments.NewView extends Backbone.View
  template: JST["templates/payments/new"]

  events:
    "submit #new-payment": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()
    @model.bind("change:errors", () =>
      this.render()
    )
  
  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (post) =>
        @model = post
        window.location.hash = "/payments/#{@model.id}"

      error: (post, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )    

  render: (user_full_name) ->    
    hash = @model.toJSON()
    hash.user_full_name = user_full_name
    $(@el).html(@template(hash))

    if @model.get('errors')?
      @displayErrors @model.get('errors')
      
    this.$("form").backboneLink(@model)
  
    return this
    
  displayErrors: (errors) ->
    addError = (field) ->
     $("#payment_#{field}_input").addClass('error')
     $("#payment_#{field}_input").append("<p class=\"inline-errors\">#{errors[field]}</p>")
    
    addError field for field in _.keys(errors)
