class BPS.Admin.Routers.Dashboard extends Backbone.Router
  routes:
    "index"     : "index"
    ".*"        : "index"

  index: ->
    new BPS.Admin.Views.Dashboard.Index(el: "#admin").render()

