Rails.application.routes.draw do
  root 'tasks#index'

  controller :sessions do
    get     'login'   => :new
    post    'login'   => :create
    delete  'logout'  => :destroy
  end

  resources :tasks
  resources :task_types
  resources :subjects
  resources :projects do
    get 'subjects' => 'projects#subjects'
  end
  resources :customers do
    get 'projects' => 'customers#projects'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
