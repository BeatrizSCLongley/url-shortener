class UrlPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    true
  end

  def destroy?
    record.user == user
  end

  def go?
    true
  end
end
