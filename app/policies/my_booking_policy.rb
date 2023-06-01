class MyBookingPolicy < ApplicationPolicy
  def update?
    user.vehicles.include?(record.vehicle)
  end

  # class Scope < Scope
  #   def resolve
  #     scope.where(user: user)
  #   end
  # end
end
