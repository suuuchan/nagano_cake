class Public::OrdersController < ApplicationController
  def new
    @customer = current_customer
    @order = Order.new
    @address = Address.new
    @addresses = current_customer.addresses
  end
  
  def confirm
    binding.pry
    @customer = current_customer
    @order_detail = @customer.order_details
  end
  
  def thanks
  end
  
  def create
  end
  
  def index
  end
  
  def show
  end
  
  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :status)
  end
end
