class BookingsController < ApplicationController
  before_action :set_vehicle, only: [:new,:create]
  before_action :set_booking, only: [:show,:edit,:update]

  def index
    @bookings = policy_scope(Booking)
    # @bookings = Booking.all
  end

  def show
    authorize @booking
    @days = days_calculator(@booking.date_from, @booking.date_to)
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def edit
    authorize @booking
  end

  def update
    authorize @booking
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.vehicle = @vehicle
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_vehicle
    @vehicle = Vehicle.find(params[:vehicle_id])
  end

  def booking_params
    params.require(:booking).permit(:date_from, :date_to, :comment)
  end

  def days_calculator(start_date, end_date)
    duration_in_seconds = end_date.at_end_of_day - start_date.at_beginning_of_day
    duration_in_days = duration_in_seconds/86400 # seconds in one day
    duration_in_days.to_i # round to nearest day
  end
end
