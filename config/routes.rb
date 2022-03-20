Rails.application.routes.draw do
  get 'static_pages/welcome'
  # Defines the root path route ("/")
  root "pantries#index"

  get '/service-worker.js' => "service_worker#service_worker"
  get '/manifest.json' => "service_worker#manifest"

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

  # api
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :orders, only: [:index, :show, :create, :destroy]
      resources :batches, only: [:index, :show, :create, :destroy]
    end
  end

  get '/about' => 'static_pages#about'
  get '/search' => 'charities#search'
  get '/charities' => 'charities#index'
  post '/donate' => 'food_items#donate'
end
