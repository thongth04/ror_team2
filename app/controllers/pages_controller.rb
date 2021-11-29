class PagesController < ApplicationController

  def home
    @foods = Product.where("product_type = 'food'").limit(8)
    @drinks = Product.where("product_type = 'drink'").limit(8)
  end

  def giohang
  end

  def food
    
    @foods = Product.where("product_type = 'food'").paginate(:page => params[:page], :per_page => 8).order('created_at desc')
   
  end
  
  def drink
    
    @drinks = Product.where("product_type = 'drink'").paginate(:page => params[:page], :per_page => 6).order('created_at desc')

  end

 
  

  def pay
  end
  def warehouse
  end
end
