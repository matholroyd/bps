class Admin::SitesController < ApplicationController
  
  def new
    @site = Site.new
  end
  
  def create 
    @user = find_user 
    @site = Site.new params[:site]
    if @site.valid? && @user.valid?
      @site.save
      @user.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  private 
  
  def find_user
    result = User.first
    result.update_attributes params[:site].delete(:user)
    result
  end
  
  
end