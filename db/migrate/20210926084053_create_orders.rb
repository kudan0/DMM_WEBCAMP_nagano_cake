class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id # 会員id
      t.string :postal_code # 配送先郵便番号
      t.string :address # 配送先住所
      t.string :name # 配送先宛名
      t.integer :postage # 送料
      t.integer :payment_method, default: "0" # 支払方法,enum
      t.integer :total_methot # 請求額
      t.integer :status, default: "0" # 注文ステータス,enum
      # t.datetime :created_at, null: false, default: "now" # 登録日時
      # t.datetime :updated_at, null: false, default: "now" # 更新日時

      t.timestamps
    end
  end
end
