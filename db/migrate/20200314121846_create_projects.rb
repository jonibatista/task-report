class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :code, uniq: true
      t.string :name, null: false
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
    add_index :projects, :code, unique: true
  end
end
