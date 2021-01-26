require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  def setup
    create_inactive_projects
  end
  
  test "the active projects on a given date" do
    Project.create!(name: "Project 1", customer: customers(:one), active_from: Date.yesterday, active_until: Date.tomorrow)
    assert_equal 1, Project.active_on(Date.tomorrow).count
  end

  test "the active projects on today" do
    Project.create!(name: "Project 1", customer: customers(:one), active_from: Date.today, active_until: Date.today)
    assert_equal 1, Project.active_on.count
  end

  test "the active projects on today when project active until is nil" do
    Project.create!(name: "Project 1", customer: customers(:one), active_from: Date.today)
    assert_equal 1, Project.active_on.count
  end

  private 
   
  def create_inactive_projects
    Project.create!(name: "Pasted project", customer: customers(:one), active_from: Date.yesterday - 1.year, active_until: Date.tomorrow - 1.year)
    Project.create!(name: "Future project", customer: customers(:one), active_from: Date.yesterday + 1.year, active_until: Date.tomorrow + 1.year)
    Project.create!(name: "Future project", customer: customers(:one), active_from: Date.today + 1.year)
  end
end
