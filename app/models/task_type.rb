class TaskType < ApplicationRecord
    validates :name, presence: true
end
