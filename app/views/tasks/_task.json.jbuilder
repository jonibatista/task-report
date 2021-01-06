json.extract!     task, :id, :task_date, :duration, :description
json.customer     task.customer.name
json.project_code task.project.code
json.project      task.project.name
json.task_type    task.task_type.name
