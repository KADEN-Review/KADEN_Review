class Public::ReviewsController < ApplicationController

  def index
    if params[:keyword].present?
      @home_appliances = HomeAppliance.where("model_number LIKE?", params[:keyword])
      @reviews = Review.where(home_appliance_id: @home_appliances.ids[0])
    elsif params[:genre_id].present?
      @reviews = Review.where(genre_id: params[:genre_id])
    else
      @reviews = Review.page(params[:page])
    end
    @genre = Genre.all
  end

  def new
    @review = Review.new
    @genre = Genre.all
  end

  def create
    @home_appliance = HomeAppliance.find(params[:home_appliance_id])
    @review = current_customer.reviews.new(review_params)
    @review.home_appliance_id = @home_appliance.id
    if @review.save
      redirect_to public_review_path(@review.id)
    else
      render template: "public/home_appliances/show"
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to public_reviews_path
  end

  def search
    @reviews = Review.search(params[:keyword])
  end

  private

  def review_params
    params.require(:review).permit(:id, :genre_id, :home_appliance_id,
                                   :model_number, :score, :review_contents,
                                   :review_title, :image)
  end
end
