class BPS.Admin.Routers.Dashboard extends Backbone.Router
  initialize: ->
    @bitcoin_addresses = new BPS.Admin.Collections.BitcoinAddressesCollection()
    @bitcoin_addresses.reset []

  routes:
    "index"     : "index"
    ".*"        : "index"

  index: ->
    bitcoin_addresses = @bitcoin_addresses
    bitcoin_addresses.fetch
      success: ->
        new BPS.Admin.Views.Dashboard.Index(el: "#admin").render(bitcoin_addresses)
        
