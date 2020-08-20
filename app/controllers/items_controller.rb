class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]

  # GET /items
  def index
    @items = Item.where(title: params[:search]) if params[:search]
    @items = Item.all unless params[:search]
    
    render json: @items
  end

  # GET /items/1
  def show
    render json: @item
  end

  # POST /items
  def create
    @item = Item.new(item_params)
    # item_category()
    if @item.save
      if item_category()
        render json: @item, status: :created, location: @item
      else
        @item.destroy
        render json: {category: "Not Exist"}, status: 400
      end
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.require(:item).permit(:title, :price, :stock, :brand, :description, :images => [], :category_id, :sub_categories => [])
    end

    # Only allow a trusted parameter "white list" through.
    def cat_params
      params.require(:item).permit()
    end

    def item_category
      return false if item_params[:category_id].nil? || item_params[:sub_categories].nil?
      @category = Category.find_by(id: item_params[:category_id])
      item_params[:sub_categories].each do |sub_category|
        @subcat = SubCategory.new(title: sub_category, category_id: @category.id, item_id: @item.id)
        unless @subcat.save
          SubCategory.where(item_id: @item.id).destroy_all
          return false
        end
      end
      return true
    end
end
