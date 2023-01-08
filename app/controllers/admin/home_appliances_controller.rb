class Admin::HomeAppliancesController < ApplicationController
  def new
    @home_appliance = HomeAppliance.new
    @genre = Genre.all
  end

  def create
    home_appliance = HomeAppliance.new(home_appliance_params)
    home_appliance.save
    redirect_to admin_home_appliance_path(home_appliance.id)
  end

  def index
    @home_appliances = HomeAppliance.page(params[:page])
  end

  def show
    @home_appliance = HomeAppliance.find(params[:id])
  end

  def edit
    @home_appliance = HomeAppliance.find(params[:id])
    @genre = Genre.all
  end

  def update
    home_appliance = HomeAppliance.find(params[:id])
    home_appliance.update(home_appliance_params)
    redirect_to admin_home_appliance_path(home_appliance.id)
  end

  def destroy
    home_appliance = HomeAppliance.find(params[:id])
    home_appliance.destroy
    redirect_to admin_home_appliances_path
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
