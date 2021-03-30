Rails.application.routes.draw do

  resources :users, except: [:index]

  namespace :api do
    resources :categories
    resources :products
    resources :orders
  end
  
end
