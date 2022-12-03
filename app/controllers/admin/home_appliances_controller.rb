class Admin::HomeAppliancesController < ApplicationController
  def new
    @home_appliance = HomeAppliance.new
    @genre = Genre.all
  end

  def create
    home_appliance = HomeAppliance.new(home_appliance_params)
    home_appliance.save
    redirect_to new_admin_home_appliance_path
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

  def search
    @home_appliances = HomeAppliance.search(params[:search])
    @search = params[:search]
    render "index"
  end
  private

  def home_appliance_params
    params.require(:home_appliance).permit(:id, :home_appliance_id, :genre_id, :model_number, :image, :name)
  end
end
