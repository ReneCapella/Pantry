Rails.application.routes.draw do
  resources :orders
  resources :batches
  resources :stores
  resources :producers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end

  devise_for :users

  resources :food_items
  resources :pantries

  get '/service-worker.js' => "service_worker#service_worker"
  get '/manifest.json' => "service_worker#manifest"

  # Defines the root path route ("/")
  root "pantries#index"
end
