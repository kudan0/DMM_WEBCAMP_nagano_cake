class Public::CartItemsController < ApplicationController
  def index
    @cart_item = CartItem.all
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.savr
    redirect_to public_cart_item_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
    @cart_item = current_customer.cart_item
    @cart_item.destroy_all
    redirect_to public_cart_item_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount, :item_id, :customer_id)
  end


end
