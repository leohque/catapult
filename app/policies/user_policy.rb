class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def edit_profile?
    true
  end

  def update_profile?
    true
  end
end
