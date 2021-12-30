class WarehousesController < ApplicationController
  
  def index
    if params[:product_type_tag]
      @products = Product.filter(params[:product_type_tag]).paginate(page: params[:page], per_page: 12)
    else
      @products = Product.search(params[:search]).paginate(page: params[:page], per_page: 12)
    end
  end
 
end
