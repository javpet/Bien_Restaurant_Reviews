Rails.application.routes.draw do
  resources :reviews # Setting up the routes for the reviews
  root "reviews#index" # reviews = reviewscontroller
end
