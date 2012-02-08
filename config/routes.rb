BPS::Application.routes.draw do
  root to: "payments#index"
  get "setup_site" => "sessions#owner_setup_site", as: "owner_setup_site"

  resources :payments, only: [:index, :new, :create, :show]
  resources :users, only: [:new, :create]
  resource :session

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
    %w{blank_slate setup_site}.each do |action|
      match "dev/#{action}" => "dev##{action}", as: "#{action}_dev"
    end
  end
end
