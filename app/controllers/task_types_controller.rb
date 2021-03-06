class TaskTypesController < ApplicationController
  before_action :set_task_type, only: %i[show edit update destroy]

  # GET /task_types
  # GET /task_types.json
  def index
    @task_types = policy_scope(TaskType)
    authorize @task_types
  end

  # GET /task_types/1
  # GET /task_types/1.json
  def show; end

  # GET /task_types/new
  def new
    @task_type = TaskType.new
    authorize @task_type
  end

  # GET /task_types/1/edit
  def edit; end

  # POST /task_types
  # POST /task_types.json
  def create
    @task_type = TaskType.new(task_type_params)
    authorize @task_type

    respond_to do |format|
      if @task_type.save
        format.html { redirect_to @task_type, notice: 'Task type was successfully created.' }
        format.json { render :show, status: :created, location: @task_type }
      else
        format.html { render :new }
        format.json { render json: @task_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_types/1
  # PATCH/PUT /task_types/1.json
  def update
    respond_to do |format|
      if @task_type.update(task_type_params)
        format.html { redirect_to @task_type, notice: 'Task type was successfully updated.' }
        format.json { render :show, status: :ok, location: @task_type }
      else
        format.html { render :edit }
        format.json { render json: @task_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_types/1
  # DELETE /task_types/1.json
  def destroy
    @task_type.destroy
    respond_to do |format|
      format.html { redirect_to task_types_url, notice: 'Task type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task_type
    @task_type = policy_scope(TaskType).find(params[:id])
    authorize @task_type
  end

  # Only allow a list of trusted parameters through.
  def task_type_params
    params.require(:task_type).permit(:name, :description)
  end
end
