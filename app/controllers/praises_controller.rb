class PraisesController < ApplicationController
  before_action :set_task
  
  def create
    @praise = current_user.praise(@task)
    if @praise.save
      redirect_back(fallback_location: tasks_path)
    else
      redirect_back(fallback_location: tasks_path)
    end
  end

  def destroy
    @praise = current_user.unpraise(@task)
    if @praise.destroy
      redirect_back(fallback_location: tasks_path)
    else
      redirect_back(fallback_location: tasks_path)
    end
  end

  private
  def set_task
    @task = Task.find(params[:task_id])
  end

end
