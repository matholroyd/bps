BPS::Application.routes.draw do
  root to: "bitcoin_addresses#index"
  get "setup_site" => "sessions#owner_setup_site", as: "owner_setup_site"

  scope 'api' do
    resources :bitcoin_addresses, only: [:index, :new, :create, :show]
  end
  resources :users, only: [:new, :create]
  resource :session

  namespace :admin do
    scope 'api' do
      resources :bitcoin_addresses
      resources :payments do
        get :refresh, on: :collection
      end
    end

    match "/dashboard", to: "dashboard#index"
    resource :site do
      get :setup_successful, on: :member
    end
    resources :users do
      resource :check_password, only: [:new, :create]
    end
  end
  
  
  # Actions handy when developing
  if BPS::Services.demo_mode? 
    %w{blank_slate setup_site sign_in add_bitcoin_address add_payment}.each do |action|
      match "demo/#{action}" => "demo##{action}", as: "#{action}_demo"
    end
  end
end
