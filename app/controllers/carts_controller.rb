class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user

  def show
    @cart = @user.cart
    @cart_items = @cart.cart_items
    # byebug
  end

  private
    def cart_params
      params.require(:cart).permit(:total, :user_id)
    end
    def find_user
      @user = current_user
    end
end
