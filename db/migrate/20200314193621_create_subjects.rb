class CreateSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :subjects do |t|
      t.string :name, null: false
      t.references :project, null: true, foreign_key: true

      t.timestamps
    end
  end
end
