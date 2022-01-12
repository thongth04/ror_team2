module ApplicationHelper
  
  def flash_class_name(name)
    case name
      when 'notice' then 'success'
      when 'alert'  then 'danger'
    else 
      name
    end
  end
  
  def create_new_cart(user)
    user.cart = Cart.new if user.cart.nil?
  end
  
  def created_at_from_parameters
    if params[:search].present?
      params[:search][:created_at]
    end
  end

  def product_sold_quantity(product)
    quantity = 0
    for item in product.order_items
      quantity += item.quantity
    end
    quantity
  end

end
