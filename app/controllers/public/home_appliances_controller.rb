class Public::HomeAppliancesController < ApplicationController
  def index
    if params[:keyword].present?
      @home_appliances = HomeAppliance.where("model_number LIKE?", params[:keyword])
    else
      @home_appliances = HomeAppliance.all
    end
  end

  def new
    @home_appliance = HomeAppliance.new
    @genre = Genre.all
  end

  def create
    home_appliance = HomeAppliance.new(home_appliance_params)
    home_appliance.save
    redirect_to public_home_appliance_path(home_appliance.id)
  end

  def show
    @home_appliance = HomeAppliance.find(params[:id])
    @review = Review.new
  end

  private

  def home_appliance_params
    params.require(:home_appliance).permit(:review_id, :genre_id, :model_number)
  end
end
