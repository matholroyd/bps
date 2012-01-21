class Admin::AdminController < ApplicationController
  protected 
  
  def find_user
    User.first
  end
  
end