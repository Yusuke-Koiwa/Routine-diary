class TasksController < ApplicationController
  before_action :move_to_root_path,  unless: :user_signed_in?
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.includes(:user)
  end

  def show
  end

  def new
    if Task.exists?(date: params[:format], user_id: current_user.id)
      redirect_to user_path(current_user)
    else
      @task = Task.new(date: params[:format], start_time: params[:format].to_datetime, user_id: current_user.id)
    end
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
      if @task.save
        redirect_to user_path(current_user)
      else
        render :new
      end
  end

  def update
    if @task.update(task_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to user_path(current_user)
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:score, :body, :start_time, :date, :user_id)
    end

    def move_to_root_path
      flash.now[:alert] = "ログインが必要です"
      render "welcome/home"
    end
end
