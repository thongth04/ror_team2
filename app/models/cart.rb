class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy

  def update_cart_total
    self.total = 0
    if self.cart_items.count > 0
      for item in self.cart_items
        self.total += item.thanh_tien
      end
    end
    self.save
  end

  def tong_tien(tam_tinh, giam_gia=20000)
    tong_tien = 0
    (tam_tinh >= giam_gia) && (tong_tien = tam_tinh - giam_gia)
    tong_tien
  end
  
end
