class MovesTaskReportDelaysIntoActionTextRichTexts < ActiveRecord::Migration[6.0]
  include ActionView::Helpers::TextHelper

  def change
    rename_column :task_reports, :delays, :delays_old
    TaskReport.all.each do |report|
      report.update_attribute(:delays, simple_format(report.delays_old))
    end
    remove_column :task_reports, :delays_old
  end
end
