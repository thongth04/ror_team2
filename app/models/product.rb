class Product < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_items
  
  def self.fill_out_attr
      products = Product.all 
      for product in products
        product.quantity = 40
        product.save
      end
  end
  
  def self.search(term)
    if term
      where('title LIKE ?', "%#{term}%")
    else
      all
    end
  end
  
  def self.filter(tag)
    if tag
      where(product_type:tag)
    else
      all
    end
  end

  
  
end

