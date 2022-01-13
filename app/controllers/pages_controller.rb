class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:purchased_orders]

  def home
    @foods = Product.where(product_type: 'food').limit(8)
    @drinks = Product.where(product_type: 'drink').limit(8)
  end

  def search_and_filter
    products = Product.all
    products = search(products, params[:term])
    products = filter(products, params[:option])
  end

  def foods
    @foods = search_and_filter.where(product_type: 'food').paginate(:page => params[:page], :per_page => 16)
  end

  def drinks
    @drinks = search_and_filter.where(product_type: 'drink').paginate(:page => params[:page], :per_page => 16)
  end

  def purchased_orders
    @orders = current_user.orders.paginate(:page => params[:page], :per_page => 10).order(created_at: :desc)
  end

  private
    def search(object, keyword)
      if keyword
        object.where('title LIKE ?', "%#{keyword}%")
      else
        object
      end
    end

    def filter(object, option)
      case option
        when "price_asc" then object.order(price: :asc)
        when "price_desc" then object.order(price: :desc)
        else object
      end
    end
end
