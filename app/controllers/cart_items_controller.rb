class CartItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_product
  before_action :find_cart

  def create
    @cart_item = @cart.cart_items.create(cart_item_params)
    @cart_item.product_id = @product.id
    @cart_item.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to cart_path(@cart)
  end

  private
    def cart_item_params
      params.require(:cart_item).permit(:product_id, :quantity, :cart_id)
    end
    def find_cart
      @cart = current_user.cart
    end
    def find_product
      @product = Product.find(params[:product_id])
    end
end
