class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :item_id # 商品id
      t.integer :customer_id # 会員id
      t.integer :amount # 数量
      # t.datetime :created_at, null: false, default: "now" # 登録日時
      # t.datetime :updated_at, null: false, default: "now" # 更新日時

      t.timestamps
    end
  end
end
