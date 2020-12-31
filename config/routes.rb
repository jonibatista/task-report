Rails.application.routes.draw do
  root 'tasks#index'

  controller :sessions do
    get     'login'   => :new
    post    'login'   => :create
    delete  'logout'  => :destroy
  end

  get 'tasks/week/:year/:week',  to: 'tasks#index', as: 'tasks_by_week'
  resources :tasks

  resources :task_types
  resources :subjects
  resources :projects do
    get 'subjects' => 'projects#subjects'
  end
  resources :customers do
    get 'projects' => 'customers#projects'
  end

  resources :task_reports
  get 'task_reports/new/:date',  to: 'task_reports#new', as: 'new_task_reports_by_week'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
