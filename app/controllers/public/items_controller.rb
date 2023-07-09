class Public::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).per(8)
  end


  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def create
    @cart_item = CartItem.new(params[:id])
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to cart_items_path
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price)
  end
end
