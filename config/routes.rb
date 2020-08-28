Rails.application.routes.draw do
  
  resources :users, only: [:index, :show, :destroy]
  mount_devise_token_auth_for 'User', at: 'users'
  
  resources :carts, except: [:update]
  post 'carts/items/:id', to: 'carts#remove_from_cart'
  
  resources :orders
  put 'orders/deliver/:id', to: 'orders#deliver'
  
  resources :items, except: [:destroy]
  resources :categories
  resources :sub_categories
  
  root 'end_points#index'
  match '*a', :to => 'handle_errors#no_route', :via => [:get]
end
