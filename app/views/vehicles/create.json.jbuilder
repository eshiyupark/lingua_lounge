if @vehicle.persisted?
  json.form render(partial: "vehicles/form", formats: :html, locals: {vehicle: Vehicle.new})
  json.inserted_item render(partial: "my_vehicles/listing", formats: :html, locals: {vehicle: @vehicle})
else
  json.form render(partial: "vehicles/form", formats: :html, locals: {vehicle: @vehicle})
end
