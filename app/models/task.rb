class Task < ApplicationRecord
  validates :title, presence: true
  validates :status, presence: true, inclusion: { in: %w[pending in_progress completed cancelled] }
  validate :due_date_after_created_at, if: -> { due_date.present? }

  belongs_to :project
  belongs_to :assigned_to, class_name: 'User', optional: true
  belongs_to :created_by, class_name: 'User'

  scope :pending, -> { where(status: 'pending') }
  scope :in_progress, -> { where(status: 'in_progress') }
  scope :completed, -> { where(status: 'completed') }
  scope :cancelled, -> { where(status: 'cancelled') }
  scope :overdue, -> { where('due_date < ? AND status != ?', Date.current, 'completed') }
  scope :due_soon, -> { where('due_date BETWEEN ? AND ?', Date.current, Date.current + 7.days) }
  scope :recent, -> { order(created_at: :desc) }

  def overdue?
    due_date.present? && due_date < Date.current && !completed?
  end

  def completed?
    status == 'completed'
  end

  def pending?
    status == 'pending'
  end

  def in_progress?
    status == 'in_progress'
  end

  def cancelled?
    status == 'cancelled'
  end

  def days_until_due
    return nil unless due_date.present?
    (due_date - Date.current).to_i
  end

  def status_label
    case status
    when 'pending' then 'Pendiente'
    when 'in_progress' then 'En progreso'
    when 'completed' then 'Completada'
    when 'cancelled' then 'Cancelada'
    else 'Desconocido'
    end
  end

  def assign_to(user)
    update(assigned_to: user)
  end

  def mark_as_completed
    update(status: 'completed')
  end

  def mark_as_in_progress
    update(status: 'in_progress')
  end

  def mark_as_pending
    update(status: 'pending')
  end

  def cancel
    update(status: 'cancelled')
  end

  private

  def due_date_after_created_at
    created_at = created_at&.to_date || Date.current
    if due_date < created_at
      errors.add(:due_date, "must be after creation date")
    end
  end
end
