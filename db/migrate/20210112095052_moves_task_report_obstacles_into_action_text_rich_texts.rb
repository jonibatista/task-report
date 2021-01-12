class MovesTaskReportObstaclesIntoActionTextRichTexts < ActiveRecord::Migration[6.0]
  include ActionView::Helpers::TextHelper

  def change
    rename_column :task_reports, :obstacles, :obstacles_old
    TaskReport.all.each do |report|
      report.update_attribute(:obstacles, simple_format(report.obstacles_old))
    end
    remove_column :task_reports, :obstacles_old
  end
end
