class ProjectPolicy < ApplicationPolicy

  def inactive?
    true
  end
  
  def projects?
    true
  end
end
