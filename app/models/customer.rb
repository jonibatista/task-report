class Customer < ApplicationRecord
    has_many :projects

    default_scope                       { order(:name) }
    scope :customers_with_projects, ->  { includes(:projects).where.not(projects: {id: nil}) }

    validates :name, presence: true

end
