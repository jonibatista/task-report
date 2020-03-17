class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.references :project, null: false, foreign_key: true
      t.references :subject, null: true, foreign_key: true
      t.references :task_type, null: false, foreign_key: true
      t.date :task_date, null: false
      t.integer :duration, null: false
      t.string :description

      t.timestamps
    end
  end
end
