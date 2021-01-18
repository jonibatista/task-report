class Project < ApplicationRecord
  belongs_to :customer
  
  default_scope { includes(:customer).order('customers.name asc, projects.name asc') }
  
  validates :name, presence: true
  validates :customer, presence: true
end
