require 'faker'

Booking.delete_all
puts "Deleted all bookings"
Vehicle.delete_all
puts "Deleted all vehicles"
User.delete_all
puts "Deleted all users"

puts "Creating users..."

user_one = User.new(email: "johndoe@gmail.com", password: "secret", first_name: "John", last_name: "Doe", licence_number: "N12345", date_of_birth: "2023-05-30", phone_number: "91234567")
user_one.save
user_two = User.new(email: "janesmith@gmail.com", password: "secret", first_name: "Jane", last_name: "Smith", licence_number: "X3245235", date_of_birth: "1999-02-22", phone_number: "+61422594506")
user_two.save
user_three = User.new(email: "monkeyman@gmail.com", password: "secret", first_name: "Monkey", last_name: "Man", licence_number: "Y23145", date_of_birth: "1992-02-11", phone_number: "03-234-12321")
user_three.save

puts "Created users"

puts "Creating 10 vehicles..."

11.times do
  vehicle = Vehicle.new(make: "#{Faker::Vehicle.make}", model: "#{Faker::Vehicle.model}", year: Faker::Vehicle.year, number_of_passengers: rand(4..7), transmission: ["automatic", "manual"].sample, price_per_day: rand(34.4..75.5).round(2), location: "#{Faker::Address.full_address}", description: "#{Faker::Quotes::Shakespeare.romeo_and_juliet_quote}")
  vehicle.user = User.all.sample
  vehicle.save
end

puts "Created 10 vehicles"

puts "Creating 4 vehicles with detailed location attributes, and owner as John Doe..."

vehicle_one = Vehicle.new(make: "#{Faker::Vehicle.make}", model: "#{Faker::Vehicle.model}", year: Faker::Vehicle.year, number_of_passengers: rand(4..7), transmission: ["automatic", "manual"].sample, price_per_day: rand(34.4..102.5).round(2), location: "228 La Trobe Street, Melbourne, VIC 3000", description: "#{Faker::Quotes::Shakespeare.romeo_and_juliet_quote}")
vehicle_one.user = user_one
vehicle_one.save
vehicle_two = Vehicle.new(make: "#{Faker::Vehicle.make}", model: "#{Faker::Vehicle.model}", year: Faker::Vehicle.year, number_of_passengers: rand(4..7), transmission: ["automatic", "manual"].sample, price_per_day: rand(34.4..75.5).round(2), location: "50 Queen Street, Melbourne, VIC 3000", description: "#{Faker::Quotes::Shakespeare.romeo_and_juliet_quote}")
vehicle_two.user = user_one
vehicle_two.save
vehicle_three = Vehicle.new(make: "#{Faker::Vehicle.make}", model: "#{Faker::Vehicle.model}", year: Faker::Vehicle.year, number_of_passengers: rand(4..7), transmission: ["automatic", "manual"].sample, price_per_day: rand(34.4..75.5).round(2), location: "209 Swanston Street, Melbourne, VIC 3000", description: "#{Faker::Quotes::Shakespeare.romeo_and_juliet_quote}")
vehicle_three.user = user_one
vehicle_three.save
vehicle_four = Vehicle.new(make: "#{Faker::Vehicle.make}", model: "#{Faker::Vehicle.model}", year: Faker::Vehicle.year, number_of_passengers: rand(4..7), transmission: ["automatic", "manual"].sample, price_per_day: rand(34.4..75.5).round(2), location: "66 Flinders Lane, Melbourne, VIC 3000", description: "#{Faker::Quotes::Shakespeare.romeo_and_juliet_quote}")
vehicle_four.user = user_one
vehicle_four.save

puts "Created 4 vehicles with specific locations, and owner as John Doe"

puts "Creating fresh user with no vehicles and no bookings..."

user_four = User.new(email: "jamieheo@gmail.com", password: "secret", first_name: "Jamie", last_name: "Heo", licence_number: "N12325", date_of_birth: "1994-03-22", phone_number: "91232567")
user_four.save

puts "Created user with no vehicles and bookings."
