class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.all
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to customers_addresses_path
  end

  def edit
    @address = Address.find(params[:id])
    redirect_to address_path
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to address_path(@address.id)
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to :index
  end

  private
  def address_params
    params.require(:address).permit(:name, :postal_code, :address, :created_at, :updated_at)
end
