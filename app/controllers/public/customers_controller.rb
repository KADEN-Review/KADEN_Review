class Public::CustomersController < ApplicationController
  before_action :move_to_signed_in
  def show
    @customer = Customer.find(params[:id])
    @reviews = @customer.reviews.page(params[:page])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to public_customer_path(current_customer.id)
  end

  def unsubscribe
    @customer = Customer.find(current_customer.id)
  end

  def withdraw
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用をお待ちしております。"
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:account)
  end

  def move_to_signed_in
    unless customer_signed_in?
      redirect_to new_customer_session_path
    end
  end
end
