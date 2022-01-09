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
  #  def reportlist
  #   if params[:search] && params[:search][:dob].present?
  #     start_date, end_date = params[:search][:dob].split(' - ')
  #     @orders = Order.having_dob_between(start_date, end_date)
  #   else
  #     @orders = Order.all.paginate(page: params[:page], per_page: 10)
  #   end
  #  end

end
