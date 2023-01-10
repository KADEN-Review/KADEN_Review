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
    #binding.pry
    if params[:keyword].present?
      @home_appliances = HomeAppliance.where("model_number LIKE?", params[:keyword])
    elsif params[:genre_id].present?
      @home_appliances = HomeAppliance.where("genre_id LIKE?", params[:genre_id])
    else
      @home_appliances = HomeAppliance.all
    end
    @genre = Genre.all
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

  private

  def home_appliance_params
    params.require(:home_appliance).permit(:id, :home_appliance_id, :genre_id, :model_number, :image, :name)
  end
end
