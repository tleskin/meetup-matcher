Rails.application.routes.draw do
  root "home#index"
  get '/', to:"home#index"

  resources :user, only: ["show"]

  resources :meetup, only: ["show", "index"]
end
