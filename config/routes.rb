Rails.application.routes.draw do
  get "users/new"
  get "home/index"
  root "home#index"
  # Standard Devise routes
  devise_for :users
  # Custom pretty routes for Devise
  devise_scope :user do
    get "/signup", to: "devise/registrations#new", as: :signup
    get "/login", to: "devise/sessions#new", as: :login
    delete "/logout", to: "devise/sessions#destroy", as: :logout
    get "/forgot_password", to: "devise/passwords#new", as: :forgot_password
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
