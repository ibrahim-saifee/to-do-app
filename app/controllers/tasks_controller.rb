class TasksController < ApplicationController

  def create
    Task.create(task_params)
    redirect_to root_path
  end

  def update_position
    params[:task] && params[:task].each_with_index do |task_id, index|
      Task.find_by_id(task_id).update_attributes(position: index,
                                                 status: params[:task_type])
    end

    render json: { status: 200 }
  end

  private

  def task_params
    params.require(:task).permit(:title, :description,
                                 :due_date, :task_type_id)
  end
end
