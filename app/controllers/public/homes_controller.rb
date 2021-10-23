class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all #ジャンル検索用
    @items = Item.limit(4).order(created_at: :desc) #新着商品用
  end

  def about
  end
end
