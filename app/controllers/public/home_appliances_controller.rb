class Public::HomeAppliancesController < ApplicationController
  def index
    @home_appliances = HomeAppliance.all
  end

  def new
  end

  def show
    @home_appliance = HomeAppliance.find(params[:id])
  end

  private

  def home_appliance_params
    params.require(:home_appliance).permit(:review_id, :model_number, :body_size)
  end
end
