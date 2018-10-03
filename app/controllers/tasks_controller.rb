class TasksController < ApplicationController

  def update_position
    params[:task] && params[:task].each_with_index do |task_id, index|
      Task.find_by_id(task_id).update_attributes(position: index,
                                                 status: params[:task_type])
    end

    render json: { status: 200 }
  end
end
