class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @customer = current_customer
    @addresses = @customer.addresses
    
  end
  
  def create
    @customer=current_customer
    @addresses = @customer.addresses
    @address = Address.new(address_params)
    if @address.save
      redirect_to addresses_path,notice: "配送先を登録しました"
    else
      render :index,notice: "登録できません"
    end
  end
  
  def edit
    @address = Address.find(params[:id])
  end
  
  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path
  end
  
  def destroy
    address = Address.find(params[:id])
    if address.customer_id == current_customer.id
      address.destroy
      redirect_to addresses_path
    end
  end
  
  private 
  def address_params
    params.require(:address).permit(:name, :address, :postal_code, :customer_id)
  end

end  

