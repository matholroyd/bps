BPS::Application.routes.draw do
  root to: "home#index"

  resources :users, only: [:new, :create]

  namespace :admin do
    resource :site    
    resources :users do
      resource :check_password, only: [:new, :create]
    end
  end
  
  # Actions handy when developing
  if Rails.env.development?
    %w{blank_slate}.each do |action|
      match "dev/#{action}" => "dev##{action}", as: "#{action}_dev"
    end
  end
end
