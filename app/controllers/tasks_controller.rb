class TasksController < ApplicationController
  def create
    current_user.tasks.create(task_params)
    redirect_to root_path
  end

  def update
    current_task.update(task_params) if current_task
    redirect_to root_path
  end

  def update_position
    params[:task] && params[:task].each_with_index do |task_id, index|
      task = current_user.tasks.find_by_id(task_id)
      task.update_attributes(position: index, status: params[:task_type]) if task
    end

    render json: { status: 200 }
  end

  def destroy
    current_task.destroy if current_task
    redirect_to root_path
  end

  private

  def task_params
    params.require(:task)
          .permit(:title, :description, :due_date, :task_type_id).to_h
          .merge(due_date: nil) do |key, date, default|
            Date.strptime(date, "%m/%d/%Y") rescue default # default value is nil
          end
  end

  def current_task
    @task ||= current_user.tasks.find_by_id(params[:id])
  end
end
