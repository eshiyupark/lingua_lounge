class Vehicle < ApplicationRecord
  validates :make, :model, :year, :number_of_passengers, :transmission, :price_per_day, presence: true
  valudates :transmission, inclusion: { in: ["Automatic", "Manual"] }
  validates :description, length: { maximum: 500 }
end
