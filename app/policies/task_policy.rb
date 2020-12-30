class TaskPolicy < ApplicationPolicy
  
  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    true
  end

  def update?
    true
  end

  def edit?
    true
  end

  def destroy?
    true
  end

  class Scope < Scope
    def resolve
      scope.where(user: @user)
    end
  end
end
