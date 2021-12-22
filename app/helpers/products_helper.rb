module ProductsHelper

  def fill_out_attr
      products = Product.select{ |product| product.id > 20 }
      for product in products
      product[:product_type] = "food"
      product.save
      end
  end
  
  def search(term)
    if term
      where('title LIKE ?', "%#{term}%")
    else
      all
    end
  end

end
