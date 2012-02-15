class Admin::BitcoinAddressesController < Admin::AdminController

  def index
    @bitcoin_addresses = BitcoinAddress.all
  end

end