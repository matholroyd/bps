BPS::Application.routes.draw do
  root to: "home#index"
  get "log_out" => "sessions#destroy", as: "log_out"
  get "log_in" => "sessions#new", as: "log_in"
  get "log_in" => "sessions#new", as: "log_in"
  get "setup_site" => "sessions#owner_setup_site", as: "owner_setup_site"

  resources :users, only: [:new, :create]

  namespace :admin do
    resource :site do
      get :setup_successful, on: :member
    end
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
