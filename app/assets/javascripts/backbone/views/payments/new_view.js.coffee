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
    @model.unset("errors")
    
    @model.save(@model.toJSON(), {
      success: (payment) =>
        @model = payment
        window.location.hash = "/finish"
        new Bps.Views.Payments.FinishView(model: @model, el: "#payments", user_full_name: @user_full_name).render()
      error: (post, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    })
    

  render: ->    
    hash = @model.toJSON()
    hash.user_full_name = @user_full_name
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
