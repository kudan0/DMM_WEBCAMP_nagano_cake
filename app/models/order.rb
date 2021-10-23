class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  
  belongs_to :customer
  
  validates :postcode, presence: true
  validates :address, presence: true
  validates :name, presence: true

  enum pay_type: {クレジットカード:0, 銀行振込:1}
  enum buy_status: {入金待ち:0, 入金確認:1,  製作中:2, 発送準備中:3, 発送済み:4}
  
end
