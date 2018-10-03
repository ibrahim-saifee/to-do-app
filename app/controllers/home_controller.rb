class HomeController < ApplicationController
  def index
    all_tasks = Task.includes(:task_type)

    @tasks = {
      pending: all_tasks.pending,
      in_progress: all_tasks.in_progress,
      completed: all_tasks.completed
    }
  end
end
