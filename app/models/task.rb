class Task < ApplicationRecord
  belongs_to :project
  belongs_to :task_type
  belongs_to :subject
  has_one :customer, through: :project

  validates :project, presence: true
  validates :task_type, presence: true  
  validates :task_date, presence: true 
  validates :duration, presence: true  

end
