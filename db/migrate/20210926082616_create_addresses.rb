class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :customer_id, null: false # 会員id
      t.string :name, null: false # 宛名
      t.string :postal_code, null: false # 郵便番号
      t.string :address, null: false # 住所
      t.datetime :created_at, null: false, default: "now" # 登録日時
      t.datetime :updated_at, null: false, default: "now" # 更新日時

      t.timestamps
    end
  end
end
