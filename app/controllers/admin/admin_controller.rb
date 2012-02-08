class Admin::AdminController < ApplicationController
  before_filter :ensure_signed_in

  layout 'admin'

  protected 
  
  def ensure_signed_in
    if current_user.nil?
      flash[:error] = "You need to be signed in."
      redirect_to root_path
    end
  end
    
end