class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin, only: [:index]
  before_action :set_order, only: %i[ show edit update destroy ]
  before_action :require_same_user, only: [:show, :edit, :update, :destroy]

  # GET /orders or /orders.json
  def index
    @orders = Order.paginate(:page => params[:page], :per_page => 10).order(created_at: :desc)
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @cart = current_user.cart
      if @cart.cart_items.empty?
          redirect_to '/', :notice => 'Your cart is empty'
          return
      end
    @order = current_user.orders.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @cart = current_user.cart
    @order = current_user.orders.new(order_params)
    create_order_from_cart(@order, @cart)

    respond_to do |format|
      if @order.save
        update_product_quantity(@order)
        @cart.destroy
        format.html { redirect_to @order, notice: "Bạn đã đặt hàng thành công" }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to orders_path, notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:name, :address, :phone, :pay_type, :order_form, :user_id, :status)
    end

    def require_same_user
      if current_user != @order.user && !current_user.admin?
        flash[:alert] = "You can only access your own orders"
        redirect_to root_path
      end
    end

    def create_order_from_cart(order, cart)
      for item in cart.cart_items
        order_item = OrderItem.create(product_id: item.product_id, quantity: item.quantity, order_id: order.id)
        order.order_items << order_item
      end
      order.total = cart.tong_tien(cart.total)
    end

    def update_product_quantity(order)
      for item in order.order_items
        item.product.quantity -= item.quantity
        item.product.save
      end
    end
end
