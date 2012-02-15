class BPS.Admin.Routers.Dashboard extends Backbone.Router
  initialize: ->
    @bitcoin_addresses = new BPS.Collections.BitcoinAddressesCollection()
    @bitcoin_addresses.url = '/admin/bitcoin_addresses'
    @bitcoin_addresses.reset []

    @payments = new BPS.Collections.PaymentsCollection()
    @payments.url = '/admin/payments'
    @payments.reset []

  routes:
    "index"     : "index"
    ".*"        : "index"

  index: ->
    @bitcoin_addresses.fetch
      success: =>
        @payments.fetch
          success: => 
            new BPS.Admin.Views.Dashboard.Index(
              el: "#admin", 
              payments: @payments, 
              bitcoin_addresses: @bitcoin_addresses
            ).render()
        
