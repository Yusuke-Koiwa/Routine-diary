class TasksController < ApplicationController
  before_action :move_to_root_path,  unless: :user_signed_in?
  before_action :set_task, only: [:show, :update, :destroy, :praised_users_index]
  before_action :correct_user?, only: [:update, :destroy]
  before_action :routine_seted?, only: [:create]

  def index
    @tasks = Task.includes([:user, :praises, :comments, user: :routines]).where("date <= ?", Date.today).
              where.not(score: nil).order(date: "DESC").order("created_at DESC").page(params[:page]).per(10)
  end

  def show
    @user = @task.user
    @comments = @task.comments.includes(:user)
    @comment = Comment.new
  end

  def create
    @task = Task.new(new_task_params)
    @task.start_time = @task.start_time.to_datetime
    @task.start_time = @task.date.to_date
    for i in 1..3 do
      @task.routine1 = current_user.routines[0].content
      @task.routine2 = current_user.routines[1].content if current_user.routines[1] != nil
      @task.routine3 = current_user.routines[2].content if current_user.routines[2] != nil
    end
    if @task.score == nil && @task.body == ""
      redirect_to user_path(current_user)
    elsif Task.where(date: @task.date, user_id: current_user.id).length >= 1
      flash[:alert] = "データが既に存在します"
      redirect_to user_path(current_user)
    elsif @task.save
      redirect_to user_path(current_user)
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @task.update(task_params)
    if @task.score == nil && @task.body == ""
      @task.destroy
      redirect_to user_path(current_user)
    else
      redirect_to task_path(@task)
    end
  end

  def destroy
    @task.destroy
    redirect_to user_path(current_user)
  end

  def praised_users_index
    @user = @task.user
    @praised_users = @task.praised_users.order("praises.created_at DESC").page(params[:page]).per(10) if @task.praises.exists?
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

    def routine_seted?
      if current_user.routines.length == 0
        flash[:alert] = "習慣にすることを先に入力してください"
        redirect_to user_path(current_user)
      end
    end
end
