class ReportlistsController < ApplicationController
 
before_action :load_user, only: [:edit, :update]

def index
    
  if params[:search] && params[:search][:created_at].present?
    beginning_day, end_day = params[:search][:created_at].split("-")
    end_day = end_day.gsub(' ', '').to_datetime.end_of_day
    @orders = Order.where(created_ad: beginning_day..end_day)
  else
    beginning_day = Date.today.beginning_of_day
    end_day = Date.today.end_of_day
    @orders = Order.where(created_at: beginning_day..end_day)
  end
  @totalreport = sum_if(beginning_day, end_day)
end

def sum_if(beginning_day, end_day) 
    @orders = Order.where(created_at: beginning_day..end_day)
    total = 0
    for order in @orders
      total += order.total 
    end
    total 
end



end

 