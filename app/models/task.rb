class Task < ApplicationRecord
  enum  status: [:pending, :in_progress, :completed]

  validates :title, :position, :status, presence: true

  belongs_to :task_type

  def type
    task_type.name
  end
end
