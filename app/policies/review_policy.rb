class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user_booked?
  end

  def new?
    user_booked?
  end

  def show?
    return true
  end

  def update?
    user_booked?
  end

  def destroy?
    user_booked?
  end

  private
    def user_booked?
      record.booking.user == user
    end

end
