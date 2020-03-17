class Subject < ApplicationRecord
  belongs_to :project
  has_one :customer, through: :project

  validates :name, presence: true
  validates :project, presence: true
end
