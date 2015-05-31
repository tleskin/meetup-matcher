Rails.application.routes.draw do
  root "home#index"
  get '/', to:"home#index"
end
