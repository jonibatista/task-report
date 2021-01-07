class TaskReportsController < ApplicationController
  before_action :set_task_report, only: %i[show edit update destroy submit approve reject]

  def index
    @task_reports = policy_scope(TaskReport).where(user: @current_user)
    authorize @task_reports
  end

  def show; end

  def new
    date = (params[:date] && Date.parse(params[:date])) || DateTime.now.beginning_of_week
    @task_report = TaskReport.new(user: @current_user, from: date.beginning_of_week, to: date.end_of_week)
    authorize @task_report
  end

  def create
    @task_report = TaskReport.new(task_report_params)
    @task_report.user = @current_user
    authorize @task_report

    if @task_report.save
      redirect_to task_report_path(@task_report), notice: 'Task report was successfully submitted.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @task_report.update(task_report_params)
      redirect_to task_report_path(@task_report), notice: 'Task report was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task_report.destroy
    redirect_to task_reports_path, notice: 'Task was successfully destroyed.'
  end

  def approvals
    authorize TaskReport
  end

  def submit
    @task_report.update(status: TaskReport.statuses[:submitted])
    TaskReportMailer.submitted(@task_report).deliver_later
    redirect_to task_report_path(@task_report), notice: "Task report was successfully submitted. Please wait for its approval"
  end

  def approve
    @task_report.update(status: TaskReport.statuses[:approved])
    TaskReportMailer.approved(@task_report).deliver_later
    redirect_to task_reports_approvals_path, notice: "Task report was successfully approved."
  end

  def reject
    @task_report.update(status: TaskReport.statuses[:rejected])
    TaskReportMailer.rejected(@task_report).deliver_later
    redirect_to task_reports_approvals_path, notice: "Task report was successfully rejected."
  end

  private

  def set_task_report
    @task_report = policy_scope(TaskReport).find(params[:id])
    authorize @task_report
  end

  def task_report_params
    params.require(:task_report).permit(:from, :to, :summary, :upcoming, :obstacles, :delays)
  end
end
