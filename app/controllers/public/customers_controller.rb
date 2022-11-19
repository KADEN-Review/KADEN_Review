class Public::CustomersController < ApplicationController
  def index
    @reviews = Review.all
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
  def withdraw
    @customer = Customer.find(params[:id])
  end

  private

  def customer_params
    params.require(:customer).permit(:account)
  end
end
