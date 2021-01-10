class TaskReportMailer < ApplicationMailer
  def submitted(task_report)
    @task_report = task_report
    @title = "#{task_report.user.name} submited #{task_report.title} week report for approval" 
    mail(from: task_report.user.email, to: 'joni.batista@tecmic.pt', cc: 'antonio.marcelo@tecmic.pt', subject: @title)
  end

  def rejected(task_report)
    @task_report = task_report
    @title = "#{task_report.user.name}'s #{task_report.title} week report was rejected" 
    mail(from: 'joni.batista@tecmic.pt', to: task_report.user.email, subject: @title)
  end

  def approved(task_report)
    @task_report = task_report
    @title = "#{task_report.user.name}'s #{task_report.title} week report was approved" 
    mail(from: 'joni.batista@tecmic.pt', to: [task_report.user.email, 'antonio.marcelo@tecmic.pt'], cc: 'suporte.fsetp@tecmic.pt', subject: @title)
  end
end
