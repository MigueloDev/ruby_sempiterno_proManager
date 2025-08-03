class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :assigned_tasks, class_name: 'Task', foreign_key: 'assigned_to_id'
  has_many :created_tasks, class_name: 'Task', foreign_key: 'created_by_id'

  scope :active, -> { all }

  def full_name
    name
  end

  def tasks_count
    assigned_tasks.count
  end

  def completed_tasks_count
    assigned_tasks.where(status: 'completed').count
  end

  def pending_tasks_count
    assigned_tasks.where(status: 'pending').count
  end

  def completion_percentage
    return 0 if tasks_count.zero?
    (completed_tasks_count.to_f / tasks_count * 100).round(1)
  end
end