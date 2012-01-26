class PaymentsController < ApplicationController
  def new
    if Site.locked_to_owner?
      @user = User.first
    else
      redirect_to new_user_path
    end
  end
  
end