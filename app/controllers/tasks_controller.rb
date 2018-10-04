class TasksController < ApplicationController

  def create
    Task.create(task_params)
    redirect_to root_path
  end

  def update_position
    params[:task] && params[:task].each_with_index do |task_id, index|
      task = Task.find_by_id(task_id)
      task.update_attributes(position: index, status: params[:task_type]) if task
    end

    render json: { status: 200 }
  end

  def destroy
    task = Task.find_by_id(params[:id])
    task.destroy if task
    redirect_to root_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :description,
                                 :due_date, :task_type_id)
  end
end
