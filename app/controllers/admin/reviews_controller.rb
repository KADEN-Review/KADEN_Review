class Admin::ReviewsController < ApplicationController

  def show
    @review = Review.find(params[:id])
  end

  def destroy
  end

  private

  def customer_params
    params.require(:customer).premit(:account)
  end

end
