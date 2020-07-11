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
    https://ecommer-api.herokuapp.com

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
        >> params: title, brand, description, stock, price, images[], cat[category_id, cat[sub_categories
    * PUT       /items/:id
        >> params: title, brand, description, stock, price, images[] 
    * DELETE    /items/:id

3) carts end-points

    * GET       /carts
    * GET       /carts/:id
    * POST      /carts         
        >> params: item_id, user_id, quantity 
    * DELETE    /carts/:id

4) users end-points

    * POST      /users         
        >> params: name, email, password, password_confirmation, avatar
    * PUT      /users         
        >> params: password, password_confirmation
    * DELETE    /users
    * POST      /users/sign_in        
        >> params: email, password
    * DELETE    /users/sign_out
        >> params: uid, access-token, client

    and Authenticate all requests you must pass this params: uid, access-token, client, with every request 

# By: Ahmed Abdelhamid

