BPS::Application.routes.draw do
  root to: "home#index"

  resources :users
  namespace :admin do
    resource :site
  end
  
  if Rails.env.development?
    %w{blank_slate}.each do |action|
      match "dev/#{action}" => "dev##{action}", as: "#{action}_dev"
    end
  end
end
