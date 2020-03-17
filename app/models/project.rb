class Project < ApplicationRecord
  belongs_to :customer
  has_many :subjects

  validates :code, uniqueness: true
  validates :name, presence: true
  validates :customer, presence: true
end
