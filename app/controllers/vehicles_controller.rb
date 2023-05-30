class VehiclesController < ApplicationController
  before_action :set_user, only: [:new, :create]

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.user = current_user
    if @vehicle.save
      redirect_to vehicle_path(@vehicle)
    else
      render :new, status:
      :unprocessable_entity
    end
  end

  private

  def set_user
    @user = current_user
  end

  def vehicle_params
    params.require(:vehicle).permit(:make, :model, :year, :number_of_passengers, :transmission, :price_per_day, :location, :description, :user_id)
  end
end
