class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_product, only: [:edit, :update, :destroy ,:create]
  
  def create
    @review = @product.reviews.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to  product_details_path(@product), success: "Thank you for your review submission."
    else
      render :new
    end
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
    redirect_back(fallback_location: root_path)
  end
  
  private
    def review_params
      params.require(:review).permit(:user_id, :content, :rating, :product_id)
    end

    def find_product
      @product = Product.find(params[:product_id])
    end
end
