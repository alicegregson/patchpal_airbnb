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
    record.user == user
  end
end
