class Public::ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
    @genre = Genre.all
  end

  def create
    @review = Review.new(review_params)
    @review.customer_id = current_customer.id
    @review.save
    redirect_to public_review_path
  end

  def show
    @review = Review.find(params[:id])
    @reviews = current_customer.reviews
  end

  private

  def review_params
    params.require(:review).permit(:star, :review_contents, :image)
  end
end
