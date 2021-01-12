class MovesTaskReportSummaryIntoActionTextRichTexts < ActiveRecord::Migration[6.0]
  include ActionView::Helpers::TextHelper
  
  def change
    rename_column :task_reports, :summary, :summary_old
    TaskReport.all.each do |report|
      report.update_attribute(:summary, simple_format(report.summary_old))
    end
    remove_column :task_reports, :summary_old
  end
end
