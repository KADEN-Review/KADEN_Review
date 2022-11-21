class Public::HomeAppliancesController < ApplicationController

  def index
    @home_appliances = HomeAppliances.all
  end

  def show
    @home_appliances = HomeAppliances.find(params[:id])
  end

  private

  def home_appliances_params
    params.require(:home_appliances).permit(:model_number, :body_size)
  end
end
