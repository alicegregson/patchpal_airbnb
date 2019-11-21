class FlatPolicy < ApplicationPolicy
  class Scope < Scope #only used for index
    def resolve
      # Anyone can see any restaurant
      scope.all.geocoded
    end
  end

  def create?
    return true
  end

  def new?
    return true
  end

  def show?
    return true
  end

  def update?
    # refactored if / else statement:
    # "user" is the current_user
    # record is the argument passed to authorise the controller
    user_is_owner?
  end

  def destroy?
    user_is_owner?
  end

  private
    def user_is_owner?
      record.user == user
    end
end
