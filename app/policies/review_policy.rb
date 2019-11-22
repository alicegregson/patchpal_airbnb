class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
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

end
