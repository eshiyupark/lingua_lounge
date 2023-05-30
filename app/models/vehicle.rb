class Vehicle < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :make, :model, :year, :number_of_passengers, :transmission, :price_per_day, presence: true
  validates :transmission, inclusion: { in: ["automatic", "manual"] }
  validates :description, length: { maximum: 1000 }
  validates :year, numericality: true
end
