class Project < ApplicationRecord
  belongs_to :customer
  has_many :subjects
  
  default_scope { includes(:customer).order('customers.name asc, projects.name asc') }
  
  validates :code, uniqueness: true
  validates :name, presence: true
  validates :customer, presence: true
end
