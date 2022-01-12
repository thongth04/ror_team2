class ProductsController < ApplicationController
  before_action :authenticate_user!, except:[:details]
  before_action :require_admin, except: [:details]
  before_action :find_product, only: [:show, :details, :edit, :update, :destroy]
  before_action :get_reviews, only: [:show, :details]

  def show
  end

  def details
  end
  
  def index
    @products = Product.paginate(page: params[:page], per_page: 5).order(created_at: :desc)
  end
  
  def edit
  end

  def new 
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      flash[:notice] = "Product was created successfully!"
      redirect_to @product
    else
      render :new
    end
  end

  def destroy
    @product.destroy
    flash[:notice] = "Product was deleted successfully!"
    redirect_to products_path
  end

  def update
    if @product.update(product_params)
      flash[:notice] = "Product was updated successfully!"
      redirect_to products_path
    else
      render :edit
    end
  end

  private
    def find_product
      @product = Product.find(params[:id])
    end
    
    def product_params
      params.require(:product).permit( :title, :description, :price, :quantity, :product_type, :image_url )
    end

    def get_reviews
      @reviews = @product.reviews.paginate(page: params[:page], per_page: 5).order(created_at: :desc)
    end
end
