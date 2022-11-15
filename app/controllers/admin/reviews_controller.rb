class Admin::ReviewsController < ApplicationController
  
  def index
    @customer = Customer.find(params[:id])
    @reviews = Review.all
  end
  
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
