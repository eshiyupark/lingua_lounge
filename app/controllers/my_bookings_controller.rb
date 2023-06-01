class MyBookingsController < ApplicationController
  before_action :set_user, only: [:index]

  def index
    @my_bookings = Booking.where(vehicle_id: @user.vehicles.ids)
  end

  def update
    @my_booking = Booking.find(params[:id])
    @my_booking.confirmation_status = params[:booking][:confirmation_status]
    if @my_booking.save
      redirect_to my_bookings_path
    else
      flash.alert = "There was an error"
    end
  end

  private

  def set_user
    @user = current_user
  end
end
