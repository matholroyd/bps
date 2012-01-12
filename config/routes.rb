BPS::Application.routes.draw do
  root to: "home#index"
  resources :users
  
  if Rails.env.development?
    %w{blank_slate}.each do |action|
      match "dev/#{action}" => "dev##{action}", as: "#{action}_dev"
    end
  end
end
