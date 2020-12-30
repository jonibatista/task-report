class CustomerPolicy < ApplicationPolicy
  
  def projects?
    true
  end

  class Scope < Scope
  end
end
