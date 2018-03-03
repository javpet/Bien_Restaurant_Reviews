Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  resources :reviews do
    resources :comments
    resource :bookmark # We only do it once because the user can only bookmark it once
  end # Setting up the routes for the reviews + comments + bookmark

  resources :users #setting up default routes for our users

  resource :session #setting up a route for sessions

  # Setting up content pages to manage from Active_admin
  get "about", to: "pages#about"
  get "terms", to: "pages#terms"

  root "pages#home" # reviews = reviewscontroller
end
