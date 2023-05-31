class MyVehiclesController < ApplicationController
  before_action :set_user, only: [:index, :edit, :update, :destroy]

  def index
    @my_vehicles = policy_scope(Vehicle)
  end

  def show
    authorize @my_vehicle
    @my_vehicle = Vehicle.find(params[:id])
  end

  def edit
    authorize @my_vehicle
    @my_vehicle = Vehicle.find(params[:id])
  end

  def update
    authorize @my_vehicle
    @my_vehicle = Vehicle.find(params[:id])
    @my_vehicle.update(my_vehicle_params)
    redirect_to my_vehicles_path
    # redirect_to my_vehicle_path(@my_vehicle) # not working, goes back to main vehicle/:id page instead of my_vehicle/:id
  end

  def destroy
    authorize @my_vehicle
    @my_vehicle = Vehicle.find(params[:id])
    @my_vehicle.destroy
    redirect_to my_vehicles_path, status: :see_other
  end

  private

  def set_user
    @user = current_user
  end

  def my_vehicle_params
    params.require(:vehicle).permit(:make, :model, :year, :number_of_passengers, :transmission, :price_per_day, :location, :description, :user_id)
  end
end
