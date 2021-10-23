class Public::AddressesController < ApplicationController
  def index
    @addresses = current_customer.addresses.all
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to addresses_path
    else
      @addresses = current_customer.addresses.all
      render :index
    end
  end

  def edit
    @address = Address.find(params[:id])
    # redirect_to address_path
  end

  def update
    @address = Address.find(params[:id])
    if  @address.update(address_params)
      redirect_to addresses_path
    else
      render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

  private
  def address_params
    params.require(:address).permit(:name, :postal_code, :address, :created_at, :updated_at)
  end
end
