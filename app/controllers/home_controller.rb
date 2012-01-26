class HomeController < ApplicationController
  def index
    if Site.locked_to_owner?
      # Display home page as normal
    else
      redirect_to new_user_path
    end
  end

end
