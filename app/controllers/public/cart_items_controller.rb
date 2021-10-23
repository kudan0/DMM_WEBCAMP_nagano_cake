class Public::CartItemsController < ApplicationController
  def index
    @cart_item = CartItem.all
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_items = current_customer.cart_items.all
      if @cart_item.quantity != nil
        @cart_items.each do |cart_item|
          if cart_item.item_id == @cart_item.item_id
            new_quantity = cart_item.quantity + @cart_item.quantity
            cart_item.update_attribute(:quantity, new_quantity)
            @cart_item.delete
          end
        end
      end

    @cart_item.save
    redirect_to public_cart_item_path
  end

  def update
    @cart_item = CartItem.find(params[:cart_item][:id])
    @cart_item.update(quantity: params[:cart_item][:quantity])
    redirect_to public_cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to public_cart_item_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity, :item_id, :customer_id)
  end


end
