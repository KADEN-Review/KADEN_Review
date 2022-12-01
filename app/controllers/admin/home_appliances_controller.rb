class Admin::HomeAppliancesController < ApplicationController
  def new
    @home_appliance = HomeAppliance.new
  end

  def index
    @home_appliances = HomeAppliance.all
  end

  def show
    @home_appliance = HomeAppliance.find(params[:id])
  end

  def edit
    @home_appliance = HomeAppliance.find(params[:id])
    @genre = Genre.all
  end

  private

  def home_appliance_params
    params.require(:home_appliance).permit(:review_id, :model_number, :body_size)
  end
end
