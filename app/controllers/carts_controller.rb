class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_cart

  def show
  end

  def update
    if params[:item_id]
      item = CartItem.find(params[:item_id])
      item_cost = item.quantity * item.product.price
      total = @cart.total
      if params[:is_checked] == "true"
        total += item_cost
      else
        if total > 20_000
          total -= item_cost
        else
          total = 0
        end
      end
    end

    @cart.total = total

    respond_to do |format|
      if @cart.save
        format.js { 
          @tam_tinh = @cart.total
          render "carts/show"
        }
      else
        format.js { render json: @cart.errors, status: :unprocessable_entity }
      end
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
