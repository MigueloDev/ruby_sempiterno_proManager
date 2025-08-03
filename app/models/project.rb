class Project < ApplicationRecord
  # Validaciones
  validates :name, presence: true
  validates :status, presence: true, inclusion: { in: %w[active completed on_hold cancelled] }
  validate :due_date_after_start_date, if: -> { start_date.present? && due_date.present? }

  # Relaciones
  has_many :tasks, dependent: :destroy
  belongs_to :created_by, class_name: 'User', optional: true

  # Scopes
  scope :active, -> { where(status: 'active') }
  scope :completed, -> { where(status: 'completed') }
  scope :on_hold, -> { where(status: 'on_hold') }
  scope :cancelled, -> { where(status: 'cancelled') }
  scope :recent, -> { order(created_at: :desc) }

  # Métodos
  def tasks_count
    tasks.count
  end

  def completed_tasks_count
    tasks.where(status: 'completed').count
  end

  def pending_tasks_count
    tasks.where(status: 'pending').count
  end

  def in_progress_tasks_count
    tasks.where(status: 'in_progress').count
  end

  def completion_percentage
    return 0 if tasks_count.zero?
    (completed_tasks_count.to_f / tasks_count * 100).round(1)
  end

  def overdue?
    due_date.present? && due_date < Date.current && status == 'active'
  end

  def days_until_due
    return nil unless due_date.present?
    (due_date - Date.current).to_i
  end

  private

  def due_date_after_start_date
    if due_date < start_date
      errors.add(:due_date, "must be after start date")
    end
  end
end