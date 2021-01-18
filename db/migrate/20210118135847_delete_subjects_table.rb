class DeleteSubjectsTable < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :tasks, :subjects
    drop_table :subjects
  end
end
