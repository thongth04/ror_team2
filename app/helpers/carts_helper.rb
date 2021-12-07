module CartsHelper

  def create_new_cart(user)
    user.cart = Cart.new if user.cart.nil?
  end

end
