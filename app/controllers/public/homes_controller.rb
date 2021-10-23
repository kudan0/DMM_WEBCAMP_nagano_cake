class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all #ジャンル検索用
    @item = Item.all #新着商品用
  end

  def about
  end
end
