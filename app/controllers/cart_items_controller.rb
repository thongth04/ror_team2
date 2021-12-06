class CartItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_cart

  def create
  end

  def destroy
  end

  private
    def cart_item_params
      params.require(:cart_item).permit(:product_id, :quantity, :cart_id)
    end
    def find_cart
      @cart = Cart.find(params[:cart_id])
    end
end
