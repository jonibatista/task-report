class Task < ApplicationRecord
  belongs_to :project
  belongs_to :task_type
  belongs_to :subject, optional: true
  belongs_to :user
  belongs_to :task_report, optional: true
  has_one :customer, through: :project

  default_scope { order(:task_date) }

  validates :task_date, presence: true
  validates :duration, presence: true
  validates :description, presence: true
  validate :cannot_change_porvided_report

  before_save :bind_task_report

  private

  def bind_task_report
    if user.present? && task_date.present?
      self.task_report = user.task_reports.to_deliver.where('task_reports.from <= ? AND task_reports.to >= ?', task_date, task_date).first 
    end
  end

  def cannot_change_porvided_report
    report =  user.task_reports.provided.where('task_reports.from <= ? AND task_reports.to >= ?', task_date, task_date).first
    if report.present?
      errors.add :base, "The reprot #{report.title} doesn't accept changes since it's #{report.status}"
    end  
  end
end