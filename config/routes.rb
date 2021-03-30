Rails.application.routes.draw do
  namespace :api do

    resources :users, except: [:index]
    resources :categories
    resources :products
    resources :orders

  end
end
