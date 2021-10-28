class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :name # ジャンル名
      # t.datetime :created_at, null: false, default: "now" # 登録日時
      # t.datetime :updated_at, null: false, default: "now" # 更新日時

      t.timestamps
    end
  end
end
