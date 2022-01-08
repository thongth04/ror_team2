class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_cart

  def show
  end

  def update
    respond_to do |format|
      format.js { 
        @tam_tinh = @cart.total
        render "carts/show"
      }
    end
  end

  private
    def cart_params
      params.require(:cart).permit(:total, :user_id)
    end

    def find_cart
      @cart = current_user.cart
    end
end
