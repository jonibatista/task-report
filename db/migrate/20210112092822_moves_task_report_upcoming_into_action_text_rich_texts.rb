class MovesTaskReportUpcomingIntoActionTextRichTexts < ActiveRecord::Migration[6.0]
  include ActionView::Helpers::TextHelper

  def change
    rename_column :task_reports, :upcoming, :upcoming_old
    TaskReport.all.each do |report|
      report.update_attribute(:upcoming, simple_format(report.upcoming_old))
    end
    remove_column :task_reports, :upcoming_old
  end
end
