class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  # GET /orders
  def index
    @orders = Order.all

    render json: @orders
  end

  # GET /orders/1
  def show
    render json: @order
  end

  # POST /orders
  def create
    @cart = Cart.find_by(user_id: order_params[:user_id])
    unless @cart.nil?
      @order = Order.find_by(user_id: order_params[:user_id], state: 'processing') || Order.new(order_params)
      if @order.save
        if set_order_items()
          render json: @order, status: :created, location: @order
        else
          render json: {error: "Out of Stock!"}, status: :unprocessable_entity
        end
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    else
      render json: {error: "cart is empty!"}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /orders/deliver/1
  def deliver
    if @order.update(state: 'delivered')
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit(:user_id, :country, :city, :address, :telephone)
    end

    def set_order_items
      @cart.item_carts.each do |itemcart|
        item = itemcart.item
        if ( (item.stock - itemcart.quantity) > 0) && item.update(stock: item.stock - itemcart.quantity)
          ItemOrder.create(quantity: itemcart.quantity, price: item.price*itemcart.quantity, item_id: item.id, order_id: @order.id)
        else
          @order.destroy
          return false
        end
      end
      @cart.destroy
    end
end
