module OrdersHelper
  
  def create_order_from_cart(order, cart)
    for item in cart.cart_items
      order_item = OrderItem.create(product_id: item.product_id, quantity: item.quantity, order_id: order.id)
      order.order_items << order_item
    end
    order.total = cart.total
  end

  def update_product_quantity(order)
    for item in order.order_items
      item.product.quantity -= item.quantity
      item.product.save
    end
  end
 
end