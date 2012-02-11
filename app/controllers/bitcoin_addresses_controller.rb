class BitcoinAddressesController < ApplicationController
  before_filter :find_user
  
  def index
    if Site.locked_to_owner?
      # Render page as normal
    else
      redirect_to new_user_path
    end
  end

  def new
  end
  
  def show
    @bitcoin_address = BitcoinAddress.find(params[:id])
    render json: @bitcoin_address.to_json
  end
  
  def create
    @bitcoin_address = BPS::Bitcoin.random_address
    @bitcoin_address.description = params[:bitcoin_address][:description]

    if @bitcoin_address.save
      render json: @bitcoin_address, status: :created
    else
      render json: @bitcoin_address.errors, status: :unprocessable_entity 
    end
    
  end
  
  private 
  
  def find_user
    @user = User.first
  end
  
end