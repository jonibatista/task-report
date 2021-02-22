class TaskReportPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    record.user == user || user.manager? || record.approved?
  end

  def create?
    record.user.task_reports.exists?(from: record.from) ? false : true
  end

  def update?
    record.user == user && record.open?
  end

  def destroy?
    record.user == user && record.open?
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
