class BookingPolicy < ApplicationPolicy
  def create?
    true
  end

  def destroy?
    true
  end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
