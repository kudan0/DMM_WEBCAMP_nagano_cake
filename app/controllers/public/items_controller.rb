class Public::ItemsController < ApplicationController
  def index
    # @items = Item.allの代わり↓
    @items=Item.page(params[:page]).per(8)
    @items_all = Item.all
    @genre = Genre.find(params[:id]) if params[:id]
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  # private

  # def cart_item_params
  #   params.require(:cart_item).permit(:item_id, :amount)
  # end
end
