class VehiclesController < ApplicationController
  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    if @vehicle.save
      redirect_to #path
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def vehicle_params
    params.require(:vehicle).permit(:make, :model, :year, :number_of_passengers, :transmission, :price_per_day, :user_id)
  end
end
