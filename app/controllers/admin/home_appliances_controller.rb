class Admin::HomeAppliancesController < ApplicationController

  def index
    @home_appliances = HomeApplianc.all
  end

  def new
    @home_applianc = HomeApplianc.find(params[:id])
    @genre = Genre.all
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def search
    @home_appliances = HomeAppliance.search(params[:search])
  end

  private

  def home_appliance_params
    params.require(:home_appliance).premit(:genre_id, :model_number, :body_size)
  end
end
