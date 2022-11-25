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
    @
    @model_number = params[:model_number]
    render "index"
  end
end
