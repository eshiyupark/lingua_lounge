class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle
  validates :confirmation_status, inclusion: { in: ["Accept", "Regect"] }
  validates :completion_status, inclusion: { in: ["Upcoming", "Active", "Completed"] }
  validates :date_from, :date_to, presence: true
  validates :description, length: { maximum: 500 }
end
