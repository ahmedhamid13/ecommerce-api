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
    unless @cart.empty?
      @order = Order.new(order_params)
      if @order.save
        set_order_items()
        render json: @order, status: :created, location: @order
      else
        render json: @order.errors, status: :unprocessable_entity
      end
    else

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
      params.require(:order).permit(:user_id, :state, :city, :address, :telephone)
    end

    def set_order_items
      @cart.item_carts.each do |itemcart|
        ItemOrder.create(quantity: itemcart.quantity, item_id: itemcart.item_id, order_id: @order.id)
      end
      @cart.destroy
    end
end
