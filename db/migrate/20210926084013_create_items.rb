class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id # ジャンルid
      t.string :name # 商品名
      t.string :image_id # 商品画像id
      t.text :introduction # 商品説明文
      t.integer :price # 税抜き価格
      t.boolean :is_active, default: "true" # 販売ステータス
      # t.datetime :created_at, null: false, default: "now" # 登録日時
      # t.datetime :updated_at, null: false, default: "now" # 更新日時

      t.timestamps
    end
  end
end
