class Task < ApplicationRecord
  enum  status: [:pending, :in_progress, :completed]

  validates :title, :position, :status, presence: true
end
