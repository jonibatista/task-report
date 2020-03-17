json.extract! task, :id, :project_id, :subject_id, :task_date, :duration, :description, :created_at, :updated_at
json.url task_url(task, format: :json)
