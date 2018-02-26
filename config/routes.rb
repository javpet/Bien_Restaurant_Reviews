Rails.application.routes.draw do
  resources :reviews do
    resources :comments
    resource :bookmark # We only do it once because the user can only bookmark it once
  end # Setting up the routes for the reviews + comments

  resources :users #setting up routes for our users

  resource :session #setting up routes for sessions

  root "reviews#index" # reviews = reviewscontroller
end
