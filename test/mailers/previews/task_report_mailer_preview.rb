# Preview all emails at http://localhost:3000/rails/mailers/task_report_mailer
class TaskReportMailerPreview < ActionMailer::Preview
    def submited
      TaskReportMailer.submitted(TaskReport.order(:created_at).first)
    end

    def rejected
      TaskReportMailer.rejected(TaskReport.order(:created_at).first)
    end

    def approved
      TaskReportMailer.approved(TaskReport.order(:created_at).first)
    end
end
