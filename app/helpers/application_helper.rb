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

  def average_rating_point(product)
    total_point = 0
    for review in product.reviews
      total_point += review.rating
    end
    avg_point = 1.0*total_point/product.reviews.count
  end

end
