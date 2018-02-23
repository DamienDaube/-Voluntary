class UserPolicy < ApplicationPolicy

def new?
  true
end


def create?
  true
end


  def show?
    true
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
