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
  
  private 
  
  def find_user
    @user = User.first
  end
  
end