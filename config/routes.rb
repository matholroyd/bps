BPS::Application.routes.draw do
  root to: "home#index"
  resources :users
end
