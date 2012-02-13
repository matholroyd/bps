class Admin::PaymentsController < Admin::AdminController

  def index
    render json: Payment.all
  end

end