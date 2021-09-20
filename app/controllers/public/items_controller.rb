class Public::ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end
  
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
  
  private
  def item_params
    params.require(:item).permit(:name, :price, :image, :introduction)
  end
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
  
end
