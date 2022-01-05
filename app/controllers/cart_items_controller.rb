class CartItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_product
  before_action :find_cart

  def create
    existed_item = @cart.cart_items.where(product_id: params[:product_id])[0]
    if existed_item
      existed_item.quantity += params[:cart_item][:quantity].to_i
      existed_item.save
    else
      @cart_item = @cart.cart_items.create(cart_item_params)
      @cart_item.product_id = @product.id
      @cart_item.save
    end
    redirect_back(fallback_location: root_path)
  end

  def update
    cart_item = @cart.cart_items.find(params[:item_id])
    
    if params[:is_increase]
      if params[:is_increase] == "true"
        cart_item.increase_by_one
      else
        cart_item.descrease_by_one
      end
    end
    cart_item.save

    respond_to do |format|
      format.js { 
        @cart_item = cart_item
        render "cart_items/cart_item"
      }
    end
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
