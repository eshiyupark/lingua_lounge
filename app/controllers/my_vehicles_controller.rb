class MyVehiclesController < ApplicationController
  before_action :set_user, only: [:index, :edit, :update, :destroy]
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]

  def index
    @my_vehicles = policy_scope(Vehicle)
  end

  private

  def set_user
    @user = current_user
  end

  def set_vehicle
    @my_vehicle = Vehicle.find(params[:id])
  end

  def my_vehicle_params
    params.require(:vehicle).permit(:make, :model, :year, :number_of_passengers, :transmission, :price_per_day, :location, :description, :user_id)
  end
end
