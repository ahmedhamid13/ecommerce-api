class EndPointsController < ApplicationController
  def index
    @endpoints = {
      category: [
        {
          method: 'GET',
          path: '/categories',
          description: ''
        },
        {
          method: 'GET',
          path: '/categories/:id',
          description: ''
        },
        {
          method: 'POST',
          path: '/categories',
          params: 'title',
          description: ''
        },
        {
          method: 'PUT',
          path: '/categories',
          params: 'title',
          description: ''
        },
        {
          method: 'DELETE',
          path: '/categories/:id',
          description: ''
        }
      ],
      item: [
        {
          method: 'GET',
          path: '/items',
          description: ''
        },
        {
          method: 'GET',
          path: '/items',
          params: 'search',
          description: ''
        },
        {
          method: 'GET',
          path: '/items/:id',
          description: ''
        },
        {
          method: 'POST',
          path: '/items',
          params: 'title, brand, description, stock, price, images[], category_id, sub_categories[]',
          description: ''
        },
        {
          method: 'PUT',
          path: '/items',
          params: 'title, brand, description, stock, price, images[]',
          description: ''
        },
        {
          method: 'DELETE',
          path: '/items/:id',
          description: ''
        }
      ],
      cart: [
        {
          method: 'GET',
          path: '/carts',
          description: ''
        },
        {
          method: 'GET',
          path: '/carts/:id',
          description: ''
        },
        {
          method: 'POST',
          path: '/carts',
          params: 'item_id, user_id, quantity',
          description: ''
        },
        {
          method: 'DELETE',
          path: '/carts/items/:id',
          description: ''
        },
        {
          method: 'DELETE',
          path: '/carts/:id',
          description: ''
        }
      ],
      order: [
        {
          method: 'GET',
          path: '/orders',
          description: ''
        },
        {
          method: 'GET',
          path: '/orders/:id',
          description: ''
        },
        {
          method: 'POST',
          path: '/orders',
          params: 'user_id, city, address, telephone',
          description: ''
        },
        {
          method: 'PUT',
          path: '/orders',
          params: 'city, address, telephone',
          description: ''
        },
        {
          method: 'DELETE',
          path: '/orders/:id',
          description: ''
        }
      ],
      user: [
        {
          method: 'GET',
          path: '/users',
          description: ''
        },
        {
          method: 'GET',
          path: '/users/:id',
          description: ''
        },
        {
          method: 'POST',
          path: '/users',
          params: 'name, email, password, password_confirmation, avatar',
          description: ''
        },
        {
          method: 'PUT',
          path: '/users',
          params: 'password, password_confirmation',
          description: ''
        },
        {
          method: 'DELETE',
          path: '/users',
          description: ''
        },
        {
          method: 'POST',
          path: '/users/sign_in',
          params: 'email, password',
          description: ''
        },
        {
          method: 'DELETE',
          path: '/users/sign_out',
          params: 'uid, access-token, client',
          description: ''
        }
      ]
    }

    render json: @endpoints
  end
end