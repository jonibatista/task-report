json.extract!     task, :id, :task_date, :duration, :description, :created_at, :updated_at
json.customer     task.customer.name
json.project_code task.project.code
json.project      task.project.name
json.subject      task&.subject&.name
json.task_type    task.task_type.name
json.user         task.user.email
json.url          task_url(task, format: :json)
