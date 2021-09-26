class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id, null: false # ジャンルid
      t.string :name, null: false # 商品名
      t.string :image_id, null: false # 商品画像id
      t.text :introduction, null: false # 商品説明文
      t.integer :price, null: false # 税抜き価格
      t.boolean :is_activ, null: false, default: "true" # 販売ステータス
      t.datetime :created_at, null: false, default: "now" # 登録日時
      t.datetime :updated_at, null: false, default: "now" # 更新日時

      t.timestamps
    end
  end
end
