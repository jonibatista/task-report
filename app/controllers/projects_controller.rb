class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = policy_scope(Project).active_on
    authorize @projects
  end

  # GET /projects/1
  # GET /projects/1.json
  def show; end

  # GET /projects/new
  def new
    @project = Project.new(active_from: Date.today)
    authorize @project
  end

  # GET /projects/1/edit
  def edit; end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    authorize @project

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def inactive
    @projects = Project.inactive_on(Date.today)
    authorize @projects
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = policy_scope(Project).find(params[:id] || params[:project_id])
    authorize @project
  end

  # Only allow a list of trusted parameters through.
  def project_params
    params.require(:project).permit(:code, :name, :description, :customer_id, :active_from, :active_until)
  end
end
