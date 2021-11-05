class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order

  enum maki_status: {着手不可:0, 製作待ち:1,  製作中:2, 製作完了:3}

  def order_status_auto_update
    if self.making_status == "製作中"
      self.order.update(status: "製作中")
    end
  end

  def make_complete_auto_update
    order_items = self.order.order_items
    making_status = order_items.pluck(:making_status)
     if making_status.all?{ |making_status| making_status == "製作完了"}
       self.order.update(status: "発送準備中")
     end
  end

  def subtotal
    self.(item.price*1.1).round.to_s(:delimited) * self.amount
  end
end
