class MyVehiclesController < ApplicationController
  before_action :set_user, only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    @vehicles = Vehicle.all
  end

  def new
    @vehicle = Vehicle.new
  end

  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  def update
    @vehicle = Vehicle.find(params[:id])
    @vehicle.update(vehicle_params)
    redirect_to vehicle_path(@vehicle)
  end

  def destroy
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy
    redirect_to vehicles_path, status: :see_other
  end

  private

  def set_user
    @user = current_user
  end

  def vehicle_params
    params.require(:vehicle).permit(:make, :model, :year, :number_of_passengers, :transmission, :price_per_day, :location, :description, :user_id)
  end
end
