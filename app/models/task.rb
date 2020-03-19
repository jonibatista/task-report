class Task < ApplicationRecord
  belongs_to :project
  belongs_to :task_type
  belongs_to :subject, optional: true
  belongs_to :user
  has_one :customer, through: :project

  default_scope { order(:task_date) }

  validates :task_date, presence: true 
  validates :duration, presence: true

end
