class PaymentsController < ApplicationController
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
    @payment = Payment.find(params[:id])
    render json: @payment.to_json
  end
  
  def create
    @payment = Payment.new(params[:payment])
    @payment.bitcoin_address = Bitcoin.random_address

    if @payment.save
      render json: @payment, status: :created
    else
      render json: @payment.errors, status: :unprocessable_entity 
    end
    
  end
  
  private 
  
  def find_user
    @user = User.first
  end
  
end