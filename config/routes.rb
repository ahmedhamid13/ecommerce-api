Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'users'
  delete 'carts/items/:id', to: 'carts#remove_from_cart'
  resources :users, only: [:index, :show]
  resources :carts, except: [:update]
  resources :orders, except: [:update]
  resources :categories
  resources :items, except: [:destroy]
end
