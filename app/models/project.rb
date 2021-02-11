class Project < ApplicationRecord
  belongs_to :customer
  
  default_scope { includes(:customer).order('customers.name asc, projects.name asc') }
  scope :active_on, -> (date = Date.today) { where('active_from <= ? AND (active_until IS NULL OR active_until >= ?)', date, date) }
  scope :inactive_on, -> (date = Date.today) { where.not('active_from <= ? AND (active_until IS NULL OR active_until >= ?)', date, date) }
  scope :to_deliver, -> { where(status: [:created, :rejected]) }

  validates :name, presence: true
  validates :customer, presence: true
  validates :active_from, presence: true
  validate :active_from_is_before_until

  private

  def active_from_is_before_until
    if active_until.present? && active_until < active_from
      errors.add :active_from, "needs to be before active until"
    end
  end

end
