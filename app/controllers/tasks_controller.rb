class TasksController < ApplicationController
  before_action :move_to_login_page, except: %i[index category_index], unless: :user_signed_in?
  before_action :set_task, only: %i[show update destroy praised_users_index]
  before_action :correct_user?, only: %i[update destroy]
  before_action :routine_seted?, only: :create
  before_action :new_task, only: :create

  def index
    @q = Task.ransack(params[:q])
    @tasks = @q.result(distinct: true).includes(:user, :routine_logs, routine_logs: :category).where("tasks.date <= ?", Date.today)
               .where.not(score: nil).order(date: "DESC").order("created_at DESC").page(params[:page]).per(10)
  end

  def show
    @user = @task.user
    @routine_logs = @task.routine_logs.includes(:category)
    @comments = @task.comments.includes(:user)
    @comment = Comment.new
  end

  def create
    if Task.where(date: @task.date, user_id: current_user.id).length >= 1
      flash[:alert] = "データが既に存在します"
    elsif @task.save
      @task.create_routine_log(current_user)
    end
    redirect_to user_path(current_user)
  end

  def update
    @task.update(task_params)
    if @task.score.nil? && @task.body == ""
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
    @routine_logs = @task.routine_logs.includes(:category)
    @user = @task.user
    @praised_users = @task.praised_users.includes(:routines, routines: :category).order("praises.created_at DESC").page(params[:page]).per(10) if @task.praises.exists?
  end

  def category_index
    @category = Category.find(params[:id])
    @q = @category.tasks.ransack(params[:q])
    @tasks = @q.result(distinct: true).where("tasks.date <= ?", Date.today).includes(:user, :routine_logs, routine_logs: :category)
               .order(date: "DESC").order("created_at DESC").page(params[:page]).per(10)
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

  def move_to_login_page
    flash[:alert] = "ログインが必要です"
    redirect_to new_user_session_path
  end

  def correct_user?
    task = Task.find(params[:id])
    return if task.user == current_user || current_user.admin?

    flash[:alert] = "権限がありません"
    redirect_to user_path(current_user)
  end

  def routine_seted?
    return unless current_user.routines.empty?

    flash[:alert] = "習慣にすることを先に入力してください"
    redirect_to user_path(current_user)
  end

  def new_task
    @task = Task.new(new_task_params)
    @task.start_time = @task.start_time.to_datetime
    @task.start_time = @task.date.to_date
  end
end
