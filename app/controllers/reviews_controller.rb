class ReviewsController < ApplicationController
  before_action :find_product, only: [:show, :details, :edit, :update, :destroy ,:create]


   def index
    @review = Review
   end
   
    
  def create
    @review = @product.reviews.new(review_params)
    @review.user_id = current_user.id
    # @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to  product_details_path(@product), success: "Thank you for your review submission."
    else
      render :new
    end
    # byebug
  end
 

  def show
    @review = @product.reviews.find(params[:id])
  end

  def edit
    @review = @product.reviews.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "Review successfully updated!"
      redirect_to product_details_path(@product)
    else
      render :edit
    end
  end
  
    def destroy
      @review = @product.reviews.find(params[:id])
      @review.destroy
      redirect_to @product
    end
  
  private
    def review_params
      params.require(:review).permit(:user_id, :content, :rating, :product_id)
    end
    def find_product
      @product = Product.find(params[:product_id])
    end
    
    def find_review
      @review = current_user.review
    end
    def set_review
      @review = Review.find_by_id(params[:id])
    end
   
  end