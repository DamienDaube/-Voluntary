class ServicePolicy < ApplicationPolicy
  def new?
    user.role == "provider" || user.role =="admin"
  end

  def create?
    user.role == "provider" || user.role == "admin"
  end

  def show?
    user.role == "provider" || user.role =="admin"
  end

  def destroy?
    user.role == "provider" || user.role =="admin"
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
