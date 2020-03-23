class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    begin
      year = params[:year].to_i || Date.today.year
      week = params[:week].to_i || Date.today.week
      @selected_week = Date.commercial(year, week)
    rescue
      @selected_week = DateTime.now.beginning_of_week
    end

    @min_week = DateTime.new(2020, 1, 1)
    if @selected_week.between?(@min_week, DateTime.now.end_of_week)
      @tasks = Task.where(user: @current_user, task_date: @selected_week..@selected_week.end_of_week)
    else
      redirect_to tasks_url, notice: 'Invalid date week'
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    customer = Customer.customers_with_projects.first
    @task = Task.new(customer: customer, project: customer.projects.first, task_date: DateTime.now, duration: 1)
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.user = @current_user
    @task.customer = Customer.find(params[:task][:customer_id])
    
    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_by_week_path(@task.task_date.year, @task.task_date.cweek), notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    @task.user = @current_user

    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasks_by_week_path(@task.task_date.year, @task.task_date.cweek), notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_by_week_path(@task.task_date.year, @task.task_date.cweek), notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:project_id, :subject_id, :task_type_id, :task_date, :duration, :description)
    end
end
