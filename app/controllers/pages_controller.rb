class PagesController < ApplicationController

  def home
    @foods = Product.where(product_type: 'food').limit(8)
    @drinks = Product.where(product_type: 'drink').limit(8)
  end

  def foods
    @foods = Product.where(product_type: 'food').paginate(:page => params[:page], :per_page => 16).order('created_at asc')
  end
  
  def drinks
    @drinks = Product.where(product_type: 'drink').paginate(:page => params[:page], :per_page => 16).order('created_at asc')
  end

  def product_details
    @product = Product.find(params[:product_id])
  end
  
  # def cart
  # end

  def pay
  end

  # def warehouse
  # end

  # def invoice
  # end
end
