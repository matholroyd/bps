class DevController < ApplicationController
  if Rails.env.development?
    
    def blank_slate
      User.destroy_all
      redirect_to root_path
    end
    
  end
end