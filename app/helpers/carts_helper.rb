module CartsHelper
  include CartItemsHelper

  def create_new_cart(user)
    user.cart = Cart.new if user.cart.nil?
  end

  def tong_tien(tam_tinh, giam_gia=20000)
    tong_tien = 0
    (tam_tinh >= giam_gia) && (tong_tien = tam_tinh - giam_gia)
    tong_tien
  end

end
