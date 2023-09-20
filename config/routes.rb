Rails.application.routes.draw do
  resources :customers
root to: 'customers#index'

   devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
 
resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
