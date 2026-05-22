Rails.application.routes.draw do
  get "search", to: "search#index"
  resources :movies, only: [ :index, :show ]
  root "movies#index"

  devise_for :users

  devise_scope :user do
    get "/signup", to: "devise/registrations#new", as: :signup
    get "/login", to: "devise/sessions#new", as: :login
    delete "/logout", to: "devise/sessions#destroy", as: :logout
    get "/forgot_password", to: "devise/passwords#new", as: :forgot_password
  end

  resources :theaters, only: [ :index, :show ]
  resources :payments, only: [ :new, :create ]

  namespace :admin do
    resources :movies
    root to: "dashboard#index"
    resources :theaters
    resources :screens
    resources :showtimes
  end

  resources :movies do
  member do
    get :booking
    get "select_seats/:showtime_id", to: "movies#select_seats", as: "select_seats"
  end
 end

 resources :my_bookings, only: [:index, :show] do
  member do
    patch :cancel
  end
end


 post "/webhooks/stripe", to: "stripe#stripe"

 get "/payments/success", to: "payments#success"

 get "payments/check_status", to: "payments#check_status"

  get "up" => "rails/health#show", as: :rails_health_check
end
