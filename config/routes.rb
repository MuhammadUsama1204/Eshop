Rails.application.routes.draw do
  root to: 'products#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  resources :users do
  post '/carts/add_to_cart/:product_id', to: 'carts#add_to_cart', as: 'add_to_cart'
end
  resources :products
  resources :carts 
  resources :line_items 
end
