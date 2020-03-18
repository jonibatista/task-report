class TaskType < ApplicationRecord
    default_scope { order(:name) }

    validates :name, presence: true
end
