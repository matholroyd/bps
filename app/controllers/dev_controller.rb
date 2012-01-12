class DevController < ApplicationController
  def blank_slate
    User.destroy_all
    redirect_to root_path
  end
end