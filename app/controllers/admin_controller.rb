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

  def reportlist
    if params[:search] && params[:search][:created_at].present?
      beginning_day, end_day = params[:search][:created_at].split("-")
      @beginning_day = beginning_day.to_date.beginning_of_day
      @end_day = end_day.to_date.end_of_day
    else
      @beginning_day = Date.today.beginning_of_day
      @end_day = Date.today.end_of_day
    end
    
    params[:option] &&  search_reportlist
    @total_report = sum_if(@beginning_day, @end_day)
    @orders = Order.where(created_at: @beginning_day..@end_day).paginate(page: params[:page], per_page: 10).order(created_at: :desc)
  end

  private
    def sum_if(beginning_day, end_day) 
      @orders = Order.where(created_at: beginning_day..end_day)
      total = 0
      for order in @orders
        total += order.total
      end
      total 
    end

    def search_reportlist
      case params[:option]
        when "yesterday"
          @beginning_day = Date.today.beginning_of_day - 1.day
          @end_day = Date.today.end_of_day - 1.day
        when "week"
          @beginning_day = Date.today.beginning_of_week
          @end_day = ( @beginning_day + 6.days).end_of_day
        when "lastweek"  
          @beginning_day = Date.today.beginning_of_week - 7.days
          @end_day = ( @beginning_day + 6.days).end_of_day 
        when "month"
          @beginning_day = Date.today.beginning_of_month 
          @end_day = ( @beginning_day + 30.days).end_of_day
        else
          @beginning_day = Date.today.beginning_of_day
          @end_day = Date.today.end_of_day
      end
    end
    
end
