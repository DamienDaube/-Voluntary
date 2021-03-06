class ServicePolicy < ApplicationPolicy
  def create?
    ["provider", "admin"].include?(user.role)
  end

  def destroy?
    record.user == user || user.role == "admin"
  end

  def index_service_categories?
    true
    # user.role == "beneficiary" || user.role =="admin"
  end

  def index_services_by_category?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
