class TasksController < ApplicationController
  before_action :move_to_root_path,  unless: :user_signed_in?
  before_action :set_task, only: [:show, :update, :destroy, :praised_users_index]
  before_action :correct_user?, only: [:update, :destroy]

  def index
    @tasks = Task.includes([:user, :praises, :comments, user: :routines]).where("date <= ?", Date.today).where.not(score: nil).order(date: "DESC").order("created_at DESC")
  end

  def show
    @user = @task.user
    @comments = @task.comments.includes(:user)
    @comment = Comment.new
  end

  def new
    if Task.exists?(date: params[:format], user_id: current_user.id)
      flash[:alert] = "無効なURLです"
      redirect_to user_path(current_user)
    elsif current_user.routines.exists?
      @task = Task.new(date: params[:format], start_time: params[:format].to_datetime, user_id: current_user.id)
    else
      flash[:alert] = "習慣化したいことを先に入力して下さい"
      redirect_to user_path(current_user)
    end
  end

  def create
    @task = Task.new(new_task_params)
    @task.start_time = @task.start_time.to_datetime
    @task.start_time = @task.date.to_date
    if @task.score == nil && @task.body == ""
      redirect_to user_path(current_user)
    else
      if @task.save
        redirect_to user_path(current_user)
      else
        redirect_to user_path(current_user)
      end
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

  def praised_users_index
    @user = @task.user
    @praised_users = @task.praised_users.order("praises.created_at DESC") if @task.praises.exists?
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def new_task_params
      params.permit(:score, :body, :start_time, :date, :user_id)
    end

    def task_params
      params.require(:task).permit(:score, :body, :start_time, :date, :user_id)
    end

    def move_to_root_path
      flash.now[:alert] = "ログインが必要です"
      render "welcome/home"
    end

    def correct_user?
      task = Task.find(params[:id])
      if task.user_id != current_user.id
        flash[:alert] = "権限がありません"
        redirect_to user_path(current_user)
      end
    end
end
