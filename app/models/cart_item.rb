class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer

  validates :customer_id, :item_id, :amount, presence: true
  validates :amount, numericality: { only_integer: true }

  def subtotal
    (item.price*1.1).round * amount
  end
end
