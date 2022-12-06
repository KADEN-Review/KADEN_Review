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
    #binding.pry
    redirect_to public_review_path(@review.id)
  end

  def show
    @review = Review.find(params[:id])
    @reviews = current_customer.reviews
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to public_reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:id, :genre_id, :home_appliance_id,
                                   :model_number, :score, :review_contents,
                                   :image)
  end
end
