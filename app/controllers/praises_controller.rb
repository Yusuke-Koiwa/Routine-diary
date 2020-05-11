class PraisesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @praised_tasks = @user.praised_tasks
  end
  
  def create
    @praise = Praise.create(praise_params)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @praise = Praise.find_by(task_id: params[:task_id], user_id: current_user.id)
    @praise.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def praise_params
    params.permit(:task_id).merge(user_id: current_user.id)
  end
end
