class Task < ApplicationRecord
  enum  status: [:pending, :in_progress, :completed]

  validates :title, :position, :status, presence: true

  belongs_to :task_type

  default_scope { order(position: :asc) }

  def type
    task_type.name.downcase
  end
end
