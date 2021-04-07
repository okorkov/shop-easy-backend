Rails.application.routes.draw do

  post 'users/user_auth'
  get 'users/logged_in'


  resources :users, only: [:create, :update, :destroy]
  resources :sessions, only: [:create, :destroy]

  namespace :api do
    resources :categories
    resources :products
    resources :carts, only: [:create, :destroy]
    resources :cart_items, only: [:destroy]
  end
  
end
