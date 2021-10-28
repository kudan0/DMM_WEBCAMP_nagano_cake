class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :item_id # 商品id
      t.integer :order_id # 注文id
      t.integer :purchase_at # 購入時価格
      t.integer :amount # 数量
      t.integer :making_status, default: "0" # 製作ステータス
      # t.datetime :created_at, null: false, default: "now" # 登録日時
      # t.datetime :updated_at, null: false, default: "now" # 更新日時

      t.timestamps
    end
  end
end
