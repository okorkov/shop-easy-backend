Rails.application.routes.draw do

  post 'users/user_auth'

  resources :users, except: [:index]
  resources :sessions, only: [:create, :destroy]

  namespace :api do
    resources :categories
    resources :products
    resources :orders
  end
  
end
