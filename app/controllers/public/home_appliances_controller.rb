class Public::HomeAppliancesController < ApplicationController
  def index
    @home_appliances = HomeAppliance.all
    @home_appliance = HomeAppliance.new
  end

  def new
    @home_appliance = HomeAppliance.new
  end

  def create
    home_appliance = HomeAppliance.new(home_appliance_params)
    home_appliance.save
    redirect_to public_home_appliance_path(home_appliance.id)
  end

  def show
    @home_appliance = HomeAppliance.find(params[:id])
  end

  private

  def home_appliance_params
    params.require(:home_appliance).permit(:review_id, :model_number, :body_size)
  end
end
