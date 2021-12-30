module AdminHelper

  def product_sold_quantity(product)
    quantity = 0
    for item in product.order_items
      quantity += item.quantity
    end
    quantity
  end
  
end
