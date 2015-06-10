Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'


  root "home#index"
  get '/', to:"home#index"
  delete '/logout', to: 'sessions#destroy'
  resources :user, only: ["show"]
  resources :tweets, only: ["index"]
  resources :meetup, only: ["show", "index"]
  resources :geolocator, only: ["create"]
  get '/auth/twitter/callback', to: 'sessions#create'
end
