class VehiclesController < ApplicationController
  before_action :set_user, only: [:new, :create, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @vehicles = Vehicle.all
    # Geocoder logic below
    @markers = @vehicles.geocoded.map do |vehicle|
      {
        lat: vehicle.latitude,
        lng: vehicle.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {vehicle: vehicle}),
        marker_html: render_to_string(partial: "marker", locals: {vehicle: vehicle})
      }
    end
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    @vehicle.user = current_user
    if @vehicle.save
      redirect_to vehicles_path
    else
      render :new, status:
      :unprocessable_entity
    end
  end

  def show
    @vehicle = Vehicle.find(params[:id])
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
