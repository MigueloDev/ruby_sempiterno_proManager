class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :mark_completed, :mark_in_progress, :assign_user]
  before_action :set_project, only: [:index, :new, :create]

  def index
    @tasks = Task.includes(:project, :assigned_to, :created_by).order(created_at: :desc)
    @pending_tasks = @tasks.pending
    @in_progress_tasks = @tasks.in_progress
    @completed_tasks = @tasks.completed
    @overdue_tasks = @tasks.overdue
  end

  def show
  end

  def new
    @task = @project.tasks.build
    @users = User.active
  end

  def create
    @task = @project.tasks.build(task_params)
    @task.created_by = current_user

    if @task.save
      redirect_to @task.project, notice: 'Tarea creada exitosamente.'
    else
      @users = User.active
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @users = User.active
  end

  def update
    if @task.update(task_params)
      redirect_to @task.project, notice: 'Tarea actualizada exitosamente.'
    else
      @users = User.active
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    project = @task.project
    @task.destroy
    redirect_to project, notice: 'Tarea eliminada exitosamente.'
  end

  def mark_completed
    @task.mark_as_completed
    redirect_to @task.project, notice: 'Tarea marcada como completada.'
  end

  def mark_in_progress
    @task.mark_as_in_progress
    redirect_to @task.project, notice: 'Tarea marcada como en progreso.'
  end

  def assign_user
    user = User.find(params[:user_id])
    @task.assign_to(user)
    redirect_to @task.project, notice: "Tarea asignada a #{user.name}."
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id]) if params[:project_id]
  end

  def task_params
    params.require(:task).permit(:title, :description, :status, :due_date, :assigned_to_id)
  end
end