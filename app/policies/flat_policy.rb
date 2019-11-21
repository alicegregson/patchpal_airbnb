class FlatPolicy < ApplicationPolicy
  class Scope < Scope #only used for index
    def resolve
      scope.geocoded
    end
  end

  def create?
    return true
  end

  def new?
    return true
  end
end
