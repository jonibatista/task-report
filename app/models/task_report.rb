class TaskReport < ApplicationRecord
  enum status: [ :created, :submitted, :rejected, :approved ]

  belongs_to :user
  has_many :tasks
  
  default_scope { order(from: :desc) }
  scope :to_deliver, -> { where(status: [:created, :rejected]) }
  scope :provided, -> { where(status: [:submitted, :approved]) }

  validates :from, presence: true
  validates :to, presence: true
  validates :summary, presence: true
  validates :upcoming, presence: true
  validates :user, presence: true

  before_save :bind_tasks

  def initialize(attributes={})
    super 
    status = TaskReport.statuses[:created]
    bind_tasks
  end

  def open?
    self.created? || self.rejected?
  end

  def title 
    from.present? ? "#{from.year}/#{from.cweek}" : ""
  end

  private 
  
  def bind_tasks
    self.tasks = user.tasks.where(task_date: from..to) if user.present?
  end
end
