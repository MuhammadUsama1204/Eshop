Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
  }
  root to: 'products#index'
  resources :users  
  resources :products
  resources :line_items
  resources :carts do
    member do
      get 'remove_from_cart', to: 'carts#remove_from_cart', as: 'remove_from_cart'
      post 'add_to_cart/:product_id', to: 'carts#add_to_cart', as: 'add_to_cart'
    end
  end
end
