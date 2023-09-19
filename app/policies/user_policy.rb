class UserPolicy < ApplicationPolicy
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def update?
    user.admin?
  end

  def destroy?

    # binding.pry

    user.admin?
  end
end
