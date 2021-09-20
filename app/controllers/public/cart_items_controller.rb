class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    # @total = @cart_items.price.all
    @numbers = [*1..10]
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end
  
  def destroy
    # current_customer.cart_items(params[:item_id]).destroy
    # redirect_to cart_items_path
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end
  
  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end
  
  def create
    # @item = Item.find(params[:cart_item][:item_id])
    
    # @cart_item.save
   
     @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    # binding.pry
     if @cart_item.blank?
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      @cart_item.save
     else
      @cart_item.amount += params[:cart_item][:amount].to_i
      @cart_item.save
     end
     redirect_to cart_items_path
  end

  #   @cart_item.amount += params[:amount].to_i
  #   @cart_item.save
  #   redirect_to cart_items_path
  # end
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
  def item_params
    params.require(:item).permit(:name, :price, :image, :introduction)
  end
end
