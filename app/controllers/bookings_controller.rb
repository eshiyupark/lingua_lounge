class BookingsController < ApplicationController
  before_action :set_vehicle, only: [:new,:create]

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    # raise
    @booking = Booking.new(booking_params)
    @booking.vehicle = @vehicle
    @booking.user = current_user
    if @booking.save
      redirect_to root
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:vehicle_id])
  end

  def booking_params
    params.require(:booking).permit(:date_from, :date_to, :comment)
  end
end
