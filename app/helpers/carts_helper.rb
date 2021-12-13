module CartsHelper
  include CartItemsHelper

  def create_new_cart(user)
    user.cart = Cart.new if user.cart.nil?
  end

  def tam_tinh(cart)
    cart.total = 0
    for item in cart.cart_items
      cart.total += thanh_tien(item)
    end
    cart.total
  end

  def tong_tien(tam_tinh, giam_gia=20000)
    tam_tinh - giam_gia
  end

end
