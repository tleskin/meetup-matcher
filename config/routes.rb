Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'



  root "home#index"


  get '/', to:"home#index"
  delete '/logout', to: 'sessions#destroy'
  resources :user, only: ["show"]
  put '/add_meetup/:id', to: "user#add_meetup"
  resources :tweets, only: ["index"]

  resources :favorites
  post '/favorites/:id', to:"favorites#create"
  resources :meetup, only: ["show", "index"]
  resources :geolocator, only: ["create"]
  get '/auth/twitter/callback', to: 'sessions#create'
end
