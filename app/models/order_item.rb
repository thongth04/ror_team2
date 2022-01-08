class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  def thanh_tien
    self.product.price * self.quantity
  end
  
end
