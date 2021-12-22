class PagesController < ApplicationController

  def home
    @foods = Product.where(product_type: 'food').limit(8)
    @drinks = Product.where(product_type: 'drink').limit(8)
  end

  def search_results
    Product.search(params[:term])
  end
  def foods
    @foods = search_results.where(product_type: 'food').paginate(:page => params[:page], :per_page => 16)
  end
  def drinks
    @drinks = search_results.where(product_type: 'drink').paginate(:page => params[:page], :per_page => 16)
  end
  
end
