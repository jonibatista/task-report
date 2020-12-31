class CreateTaskReports < ActiveRecord::Migration[6.0]
  def change
    create_table :task_reports do |t|
      t.date :from, null: false
      t.date :to, null: false
      t.integer :status, default: 0
      t.string :summary, null: false
      t.string :upcoming, null: false
      t.string :obstacles, null: false
      t.string :delays, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_reference :tasks, :task_report, foreign_key: true
  end
end
