class Admin::PaymentsController < Admin::AdminController

  def index
    @payments = Payment.includes(:bitcoin_address)
  end
  
  def refresh
    TransactionImporter.import_for BitcoinAddress.all
    
    render text: 'success'
  end

end