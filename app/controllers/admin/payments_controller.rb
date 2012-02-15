class Admin::PaymentsController < Admin::AdminController

  def index
    @payments = Payment.includes(:bitcoin_address)
  end

end