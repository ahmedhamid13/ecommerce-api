# E-Commerce API

# Getting Start

1. Download the zipped file and unzip it or Clone it
    ```
    https://github.com/Ahmed-Abd-elhamid/ecommerce-api
    ```
2. cd inside the project
    ```sh
    cd ecommerce-api
    ```
3.  Run this command to install all gems we used
    ```sh
    bundle install
    ```
4. run this command to create your database
    ```sh
    rake db:create db:migrate
    ```
5. seed the database - generate fake test data
    ```sh
    rake db:seed
    ```
6. get api-endpoints by
    ```sh
    rake routes
    ```
7. Start your server
    ```sh
    rails server
    ```

# Production ecommece-api url
    https://api-ecomm.herokuapp.com/

# Api-EndPoints

1) categoreis end-points

    * GET       /categories
    * GET       /categories/:id
    * POST      /categories         
        >> params: title
    * PUT       /categories/:id          
        >> params: title
    * DELETE    /categories/:id

2) items end-points

    * GET       /items
    * GET       /items          
        >> params: search
    * GET       /items/:id
    * POST      /items         
        >> params: title, brand, description, stock, price, images[], category_id, sub_categories[]
        >> params: title, brand, description, stock, price, images[] 
    * DELETE    /items/:id

3) carts end-points

    * GET       /carts
    * GET       /carts/:id
    * POST      /carts         
        >> params: item_id, user_id, quantity 
    * DELETE    /carts/:id
    * DELETE    /carts/items/:id

4) orders end-points

    * GET       /orders
    * GET       /orders/:id
    * POST      /orders         
        >> params: user_id, city, address, telephone
    * PUT      /orders         
        >> params: city, address, telephone 
    * DELETE    /orders/:id

5) users end-points

    * GET       /users
    * GET       /users/:id
    * POST      /users         
        >> params: name, email, password, password_confirmation, avatar
    * PUT      /users         
        >> params: password, password_confirmation
    * DELETE    /users
    * POST      /users/sign_in        
        >> params: email, password
    * DELETE    /users/sign_out
        >> params: uid, access-token, client

    To Authenticate all requests you should pass this params: uid, access-token, client, with every request in header.. but for now all request doesn't require authentication.

# By: Ahmed Abdelhamid

