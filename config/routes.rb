Rails.application.routes.draw do
  resources :reviews do
    resources :comments
  end # Setting up the routes for the reviews + comments

  resources :users #setting up routes for our users

  resources :sessions #setting up routes for sessions

  root "reviews#index" # reviews = reviewscontroller
end
