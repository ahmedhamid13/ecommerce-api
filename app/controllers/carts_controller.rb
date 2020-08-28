class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :update, :destroy, :remove_from_cart]

  # GET /carts
  def index
    @carts = Cart.all

    render json: @carts
  end

  # GET /carts/1
  def show
    render json: @cart
  end

  # POST /carts
  def create
    @cart = Cart.find_by(user_id: cart_params[:user_id]) || Cart.new(user_id: cart_params[:user_id])

    if !@cart.id.nil? || @cart.save
      added = add_to_cart()
      render json: @cart, status: :created, location: @cart if added
      render json: {cart: "cannot add it now!"}, status: 400 unless added
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /carts/1
  def update
    if @cart.update(cart_params)
      render json: @cart
    else
      render json: @cart.errors, status: :unprocessable_entity
    end
  end

  # POST /carts/items/1
  def remove_from_cart
    @cart.item_carts.find_by(item_id: cart_params[:item_id]).destroy
    @cart.destroy if @cart.item_carts.empty?
  end

  # DELETE /carts/1
  def destroy
    @cart.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cart_params
      params.require(:cart).permit(:user_id, :quantity, :item_id)
    end

    def add_to_cart
      @itemcart = ItemCart.find_by(item_id: params[:item_id], cart_id: @cart.id) || ItemCart.new(item_id: params[:item_id], cart_id: @cart.id, quantity: params[:quantity].to_i)

      if @itemcart.id.nil?
        return true if @itemcart.save
      else
        return true if @itemcart.update(quantity: @itemcart.quantity + params[:quantity].to_i )
      end

      false
    end
end
