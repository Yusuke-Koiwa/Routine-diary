class PraisesController < ApplicationController
  before_action :move_to_login_page, unless: :user_signed_in?
  before_action :set_task

  def create
    @praise = current_user.praise(@task)
    @task.create_notification_praise(current_user)
  end

  def destroy
    @praise = current_user.unpraise(@task)
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end

  def move_to_login_page
    flash[:alert] = "ログインが必要です"
    redirect_to new_user_session_path
  end
end
