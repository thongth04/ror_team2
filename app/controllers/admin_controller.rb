class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  def dashboard
  end

  def warehouse
    if params[:product_type_tag]
      @products = Product.filter(params[:product_type_tag]).paginate(page: params[:page], per_page: 12)
    else
      @products = Product.search(params[:term]).paginate(page: params[:page], per_page: 12)
    end
  end
end
