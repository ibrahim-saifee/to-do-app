class Task < ApplicationRecord
  enum  status: [:pending, :in_progress, :completed]
end
