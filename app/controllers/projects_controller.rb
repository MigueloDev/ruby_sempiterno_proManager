class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.includes(:tasks, :created_by).order(created_at: :desc)
    @active_projects = @projects.active
    @completed_projects = @projects.completed
  end

  def show
    @tasks = @project.tasks.includes(:assigned_to, :created_by).order(created_at: :desc)
    @pending_tasks = @tasks.pending
    @in_progress_tasks = @tasks.in_progress
    @completed_tasks = @tasks.completed
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project, notice: 'Proyecto creado exitosamente.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Proyecto actualizado exitosamente.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @project.tasks.exists?
      redirect_to projects_path, alert: 'No se puede eliminar un proyecto que tiene tareas.'
    else
      @project.destroy
      redirect_to projects_path, notice: 'Proyecto eliminado exitosamente.'
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :status, :start_date, :due_date)
  end
end