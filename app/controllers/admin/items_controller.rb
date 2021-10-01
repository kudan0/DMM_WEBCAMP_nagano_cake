class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @genre = Genre.all
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genre = Genre.all
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_items_path
  end

  private
  def item_params
    params.require(:item).permit(:name,:genre_id, :image, :introduction, :price, :is_active, :create_at, :update_at)
  end
end
