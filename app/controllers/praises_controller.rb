class PraisesController < ApplicationController
  
  def create
    @praise = Praise.create(task_id: params[:task_id], user_id: current_user.id)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @praise = Praise.find_by(task_id: params[:task_id], user_id: current_user.id)
    @praise.destroy
    redirect_back(fallback_location: root_path)
  end

end
