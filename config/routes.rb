Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'users'
  resources :carts
  resources :categories
  resources :items, except: :destroy
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end