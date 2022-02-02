Rails.application.routes.draw do
  resources :food_items
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/service-worker.js' => "service_worker#service_worker"
  get '/manifest.json' => "service_worker#manifest"

  # Defines the root path route ("/")
  root "food_items#index"
end
