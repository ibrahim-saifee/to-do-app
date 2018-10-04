class Task < ApplicationRecord
  enum  status: [:pending, :in_progress, :completed]

  validates :title, :status, presence: true

  belongs_to :task_type

  default_scope { order(position: :asc) }

  before_save :assign_position

  def type
    task_type.name.downcase
  end

  private

  def assign_position
    self.position = Task.maximum(:position) + 1 if self.position.nil?
  end
end
