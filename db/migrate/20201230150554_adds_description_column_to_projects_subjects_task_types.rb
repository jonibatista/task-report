class AddsDescriptionColumnToProjectsSubjectsTaskTypes < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :description, :string
    add_column :subjects, :description, :string
    add_column :task_types, :description, :string
  end
end
