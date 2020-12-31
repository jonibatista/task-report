class TaskReport < ApplicationRecord
  enum status: [ :created, :submitted, :rejected, :resubmitted, :approved ]

  belongs_to :user
  has_many :tasks
  
  validates :from, presence: true
  validates :to, presence: true
  validates :summary, presence: true
  validates :upcoming, presence: true
  validates :user, presence: true
  
  def initialize(attributes={})
    super 
    status = TaskReport.statuses[:created]
  end

  def title 
    from.present? ? "#{from.year}/#{from.cweek}" : ""
  end
end
