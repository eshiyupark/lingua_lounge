class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle
  # validates :confirmation_status, inclusion: { in: ["accept", "reject"] }
  # validates :completion_status, inclusion: { in: ["upcoming", "active", "completed"] }
  validates :date_from, :date_to, presence: true
  validates :comment, length: { maximum: 500 }
  # validate :validate_end_date_before_start_date

  # def validate_end_date_before_start_date
  #   if date_to && date_from
  #     errors.add(:date_to, "jdbsafkdb") if date_to < date_from
  #   end
  # end
end
