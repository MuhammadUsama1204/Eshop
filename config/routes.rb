Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :products, only: %i[index]
    end
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
  }
  root to: 'products#index'
  resources :users  
  resources :products
  resources :line_items
  resources :orders do
    member do
      get 'download_invoice'
    end
  end
  resources :carts do
    member do
      get 'remove_from_cart', to: 'carts#remove_from_cart', as: 'remove_from_cart'
      post 'add_to_cart/:product_id', to: 'carts#add_to_cart', as: 'add_to_cart'
    end
  end
  post 'update_quantity/:id', to: 'carts#update_quantity', as: 'update_quantity'
end
