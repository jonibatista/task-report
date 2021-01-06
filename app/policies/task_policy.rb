class TaskPolicy < ApplicationPolicy
  
  def index?
    true
  end

  def show?
    true
  end

  def create?
    record.task_report.nil? || record.task_report.open?
  end

  def new?
    create?
  end

  def update?
    create?
  end

  def edit?
    update?
  end

  def destroy?
    create?
  end

  class Scope < Scope
    def resolve
      scope.where(user: @user)
    end
  end
end
