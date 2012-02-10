BPS::Application.routes.draw do
  root to: "bitcoin_addresses#index"
  get "setup_site" => "sessions#owner_setup_site", as: "owner_setup_site"

  resources :bitcoin_addresses, only: [:index, :new, :create, :show]
  resources :users, only: [:new, :create]
  resource :session

  namespace :admin do
    match "/dashboard", to: "dashboard#index"
    resources :bitcoin_addresses
    resources :users do
      resource :check_password, only: [:new, :create]
    end
    resource :site do
      get :setup_successful, on: :member
    end
  end
  
  # Actions handy when developing
  if Rails.env.development?
    %w{blank_slate setup_site sign_in add_bitcoin_address add_payment}.each do |action|
      match "dev/#{action}" => "dev##{action}", as: "#{action}_dev"
    end
  end
end
