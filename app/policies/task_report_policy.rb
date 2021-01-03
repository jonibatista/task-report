class TaskReportPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    record.user == user && (record.created? || record.rejected?)
  end

  def destroy?
    record.user == user && !record.approved?
  end

  def approvals?
    user.manager?
  end

  def submit?
    update?
  end

  def approve?
    record.submitted? && user.manager?
  end

  def reject?
    approve?
  end

  class Scope < Scope
    def resolve
      if user.manager?
        scope.all
      else
        scope.where(user: user) 
      end
    end
  end
end
