class Public::ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
    @genre = Genre.all
  end

  def create
    home_appliance = HomeAppliance.find(params[:home_appliance_id])
    review = current_customer.reviews.new(review_params)
    review.home_appliance_id = home_appliance.id
    review.save
    redirect_to public_review_path(review.id)
  end

  def show
    @review = Review.find(params[:id])
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
                                   :review_title, :image)
  end
end
