class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle
  # validates :confirmation_status, inclusion: { in: ["accept", "reject"] }
  # validates :completion_status, inclusion: { in: ["upcoming", "active", "completed"] }
  validates :date_from, :date_to, presence: true
  validates :comment, length: { maximum: 500 }

  validate :date_from_before_date_to

  def date_from_before_date_to
    if self.date_from > self.date_to
      errors.add(:date_from, "should be before end date")
    end
  end
end
