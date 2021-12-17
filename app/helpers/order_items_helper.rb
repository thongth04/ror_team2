module OrderItemsHelper

  def create_order_items(order, cart)
    for item in cart.cart_items
      order_item = OrderItem.create(product_id: item.product_id, quantity: item.quantity, order_id: order.id)
      order.order_items << order_item
    end
  end

end
