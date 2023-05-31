class PagesController < ApplicationController
  def home
    @vehicles = Vehicle.all
    # Geocoder logic below
    @markers = @vehicles.geocoded.map do |vehicle|
      {
        lat: vehicle.latitude,
        lng: vehicle.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {vehicle: vehicle})
      }
    end
  end
end
