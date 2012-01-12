class HomeController < ApplicationController
  def index
    unless User.exists?
      redirect_to new_user_path
    end
  end

end
