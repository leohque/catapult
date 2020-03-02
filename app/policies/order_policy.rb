class OrderPolicy < ApplicationPolicy
  class Scope < Scope # Scope represents the class Oder
    def resolve
      scope.where(user: user)
    end
  end

  def index?
    true
  end

  def show?
    record.user == user # record represents the specific object
  end

  def create?
    index?
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def cancel?
    record.user == user
  end

  def confirm?
    cancel?
  end
end
