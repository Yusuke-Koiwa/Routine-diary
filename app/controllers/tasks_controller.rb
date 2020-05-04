class TasksController < ApplicationController
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
    respond_to do |format|
      if @task.save
        format.html { redirect_to user_path(current_user) }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to user_path(current_user) }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user) }
      format.json { head :no_content }
    end
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:score, :body, :start_time, :date, :user_id)
    end
end
