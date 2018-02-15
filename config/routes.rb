Rails.application.routes.draw do
  resources :reviews do
    resources :comments
  end # Setting up the routes for the reviews + comments

  root "reviews#index" # reviews = reviewscontroller
end
