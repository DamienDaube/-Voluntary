class UserPolicy < ApplicationPolicy
  def show?
    record.user == user
  end

  def edit?
    record.user == user
  end

  def update?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
