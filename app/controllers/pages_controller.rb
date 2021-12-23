class PagesController < ApplicationController
  include ProductsHelper

  def home
    @foods = Product.where(product_type: 'food').limit(8)
    @drinks = Product.where(product_type: 'drink').limit(8)
  end

  def search_and_filter
    products = Product.all
    products = filter(products, params[:option])
    products = search(products, params[:term])
  end
  def foods
    @foods = search_and_filter.where(product_type: 'food').paginate(:page => params[:page], :per_page => 16)
  end
  def drinks
    @drinks = search_and_filter.where(product_type: 'drink').paginate(:page => params[:page], :per_page => 16)
  end
  
end
