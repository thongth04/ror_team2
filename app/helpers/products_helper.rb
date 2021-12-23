module ProductsHelper
  
  def search(object, keyword)
    if keyword
      object.where('title LIKE ?', "%#{keyword}%")
    else
      object
    end
  end

  def filter(object, option)
    case option
      when "price_asc" then object.order(price: :asc)
      when "price_desc" then object.order(price: :desc)
      else object
    end
  end

end
