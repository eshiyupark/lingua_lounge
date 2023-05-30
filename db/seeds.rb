require 'faker'

Vehicle.delete_all
puts "Deleted all vehicles"
Booking.delete_all
puts "Deleted all bookings"
User.delete_all
puts "Deleted all users"

puts "Creating users..."

user_one = User.new(email: "johndoe.@gmail.com", password: "secret", first_name: "John", last_name: "Doe", licence_number: "N12345", date_of_birth: "2023-05-30", phone_number: "91234567")
user_one.save
user_two = User.new(email: "janesmith.@gmail.com", password: "secret", first_name: "Jane", last_name: "Smith", licence_number: "X3245235", date_of_birth: "1999-02-22", phone_number: "+61422594506")
user_two.save
user_three = User.new(email: "monkeyman.@gmail.com", password: "secret", first_name: "Monkey", last_name: "Man", licence_number: "Y23145", date_of_birth: "1992-02-11", phone_number: "03-234-12321")
user_three.save
puts "Created users"

puts "Creating 15 vehicles..."

15.times do
  vehicle = Vehicle.new(make: "#{Faker::Vehicle.make}", model: "#{Faker::Vehicle.model}", year: Faker::Vehicle.year, number_of_passengers: rand(4..7), transmission: ["automatic", "manual"].sample, price_per_day: rand(34.4..75.5).round(2), location: "#{Faker::Address.city}", description: "#{Faker::Quotes::Shakespeare.romeo_and_juliet_quote}")
  vehicle.user = User.all.sample
  vehicle.save
end

puts "Created vehicles"
