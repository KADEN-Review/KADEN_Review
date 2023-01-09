class Admin::ReviewsController < ApplicationController

  def index
    if params[:keyword].present?
      @home_appliances = HomeAppliance.where("model_number LIKE?", params[:keyword])
      @reviews = Review.where(home_appliance_id: @home_appliances.ids[0])
    elsif params[:genre_id].present?
      @reviews = Review.where(genre_id: params[:genre_id])
    else
      @reviews = Review.all
    end
    @genre = Genre.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to admin_reviews_path
  end

  private

  def customer_params
    params.require(:customer).premit(:account)
  end

end
