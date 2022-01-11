module AdminHelper

  def product_sold_quantity(product)
    quantity = 0
    for item in product.order_items
      quantity += item.quantity
    end
    quantity
  end
  
  
  def sum_report
    total = 0
    orders = Order.all
    
    for order in orders
      total += order.total 
    end
    total 
  end


end
