Rails.application.routes.draw do
  get 'search', to: 'search#index'
  resources :movies, only: [:index, :show]
  root "movies#index"

  devise_for :users

  devise_scope :user do
    get "/signup", to: "devise/registrations#new", as: :signup
    get "/login", to: "devise/sessions#new", as: :login
    delete "/logout", to: "devise/sessions#destroy", as: :logout
    get "/forgot_password", to: "devise/passwords#new", as: :forgot_password
  end

  resources :theaters, only: [:index, :show]

  namespace :admin do
    resources :movies
    root to: "dashboard#index"
    resources :theaters
  end

  get "up" => "rails/health#show", as: :rails_health_check
end