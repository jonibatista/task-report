class AddsExperationDateColumnsToProjects < ActiveRecord::Migration[6.0]
  def up
    add_column :projects, :active_from, :date
    add_column :projects, :active_until, :date

    Project.update_all(active_from: Date.new(2020, 1, 1))

    change_column_null :projects, :active_from, false
  end

  def down
    remove_column :projects, :active_from, :date
    remove_column :projects, :active_until, :date
  end
end
