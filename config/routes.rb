Rails.application.routes.draw do
  
  post 'users/user_auth'

  resources :users, except: [:index]

  namespace :api do
    resources :categories
    resources :products
    resources :orders
  end
  
end
