require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "Should not be valid when reference an inactive project" do
    project_inactive = Project.create!(name: "Project 1", customer: customers(:one), active_from: Date.yesterday, active_until: Date.today)
    assert Task.new(project: project_inactive, task_type: task_types(:one), user: users(:one), description: "Task 1", duration: 1, task_date: Date.today).valid?
    assert Task.new(project: project_inactive, task_type: task_types(:one), user: users(:one), description: "Task 2", duration: 1, task_date: Date.tomorrow).invalid?
    assert Task.new(project: project_inactive, task_type: task_types(:one), user: users(:one), description: "Task 2", duration: 1, task_date: Date.tomorrow).invalid?
  end
end
