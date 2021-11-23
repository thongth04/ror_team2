class PagesController < ApplicationController

  def home
    @foods = Product.where("product_type = 'food'").limit(8)
    @drinks = Product.where("product_type = 'drink'").limit(8)
  end

  def giohang
  end

  def food 
  end
  
  def drink
  end

  def pay
  end
  def warehouse
  end
end
