class UsersController < ApplicationController
  def index
    @users = User.all.order(:name)
  end

  def show
    @user = User.find(params[:id])
    @assigned_tasks = @user.assigned_tasks.includes(:project).order(created_at: :desc)
    @created_tasks = @user.created_tasks.includes(:project).order(created_at: :desc)
  end
end