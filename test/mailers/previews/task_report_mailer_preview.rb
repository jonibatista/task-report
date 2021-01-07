# Preview all emails at http://localhost:3000/rails/mailers/task_report_mailer
class TaskReportMailerPreview < ActionMailer::Preview
    def submited
      TaskReportMailer.submitted(TaskReport.first)
    end

    def rejected
      TaskReportMailer.rejected(TaskReport.first)
    end

    def approved
      TaskReportMailer.approved(TaskReport.first)
    end
end
