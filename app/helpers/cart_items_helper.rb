module CartItemsHelper

  def thanh_tien(cart_item)
    cart_item.product.price * cart_item.quantity
  end

  def increase_by_one(item)
    item.quantity += 1
    item.save
  end

  def descrease_by_one(item)
    item.quantity -= 1 if item.quantity >= 1
    item.save
  end

end
