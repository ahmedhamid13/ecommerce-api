Rails.application.routes.draw do
  root 'end_points#index'
  mount_devise_token_auth_for 'User', at: 'users'
  resources :users, only: [:index, :show]
  resources :carts, except: [:update]
  delete 'carts/items/:id', to: 'carts#remove_from_cart'
  resources :orders
  put 'orders/deliver/:id', to: 'orders#deliver'
  resources :categories
  resources :items, except: [:destroy]
end
