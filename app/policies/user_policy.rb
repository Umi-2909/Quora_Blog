class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def update?
      user.admin?
    end

    def destroy?
      user.admin?
    end
  end
end
