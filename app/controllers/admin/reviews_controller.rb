class Admin::ReviewsController < ApplicationController

  def index
    @reviews = Review.page(params[:page])
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
