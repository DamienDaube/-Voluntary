class ServicePolicy < ApplicationPolicy
  def new?

  end

  def create?
    true
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
