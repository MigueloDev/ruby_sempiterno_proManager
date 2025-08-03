class DashboardController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    return unless user_signed_in?

    @total_projects = Project.count
    @active_projects = Project.active.count
    @completed_projects = Project.completed.count
    @total_tasks = Task.count
    @pending_tasks = Task.pending.count
    @completed_tasks = Task.completed.count
    @overdue_tasks = Task.overdue.count

    @recent_projects = Project.includes(:tasks).recent.limit(5)

    @users_with_tasks = User.includes(:assigned_tasks).where(id: Task.pending.select(:assigned_to_id))

    @due_soon_tasks = Task.due_soon.includes(:project, :assigned_to).limit(10)

    @projects_with_progress = Project.active.includes(:tasks).select do |project|
      project.completion_percentage > 0
    end.sort_by(&:completion_percentage).reverse.first(5)

    @users_stats = User.includes(:assigned_tasks).map do |user|
      {
        user: user,
        total_tasks: user.assigned_tasks.count,
        completed_tasks: user.assigned_tasks.where(status: 'completed').count,
        completion_percentage: user.completion_percentage
      }
    end
  end
end