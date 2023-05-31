class MyBookingsController < ApplicationController
  before_action :set_user, only: [:index]

  def index
    @my_bookings = Booking.where(vehicle_id: @user.vehicles.ids)
  end

  def update

  end

  private

  def set_user
    @user = current_user
  end
end
