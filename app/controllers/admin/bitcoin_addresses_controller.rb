class Admin::BitcoinAddressesController < Admin::AdminController

  def index
    render json: BitcoinAddress.all
  end

end