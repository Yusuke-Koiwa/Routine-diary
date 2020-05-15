class PraisesController < ApplicationController
  before_action :set_task
  
  def create
    @praise = current_user.praise(@task)
  end

  def destroy
    @praise = current_user.unpraise(@task)
  end

  private
  def set_task
    @task = Task.find(params[:task_id])
  end

end
