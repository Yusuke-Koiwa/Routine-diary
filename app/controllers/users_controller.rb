class UsersController < ApplicationController
  before_action :move_to_login_page, unless: :user_signed_in?
  before_action :set_user
  before_action :correct_user?, only: [:edit, :update]
  before_action :admin_user?, only: :destroy

  def show
    @tasks = @user.tasks.includes(:comments)
    @routines = @user.routines.includes(:category)
    @routine = Routine.new if @routines.count < 3
    if @tasks.present?
      @done_days = @user.done_days(@tasks)
      @continuous_days = @user.continuous_days(@tasks)
    else
      @done_days = 0
      @continuous_days = 0
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "変更を保存しました"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to root_path
  end

  def praises_index
    @routines = @user.routines.includes(:category)
    @praised_tasks = @user.praised_tasks.includes(:user, :routine_logs, routine_logs: :category).order("praises.created_at DESC").page(params[:page]).per(10)
  end

  def follow_index
    @routines = @user.routines.includes(:category)
    @follow_users = @user.follow_users.includes(:routines, routines: :category).order("relationships.created_at DESC").page(params[:page]).per(10)
  end

  def follower_index
    @routines = @user.routines.includes(:category)
    @follower_users = @user.follower_users.includes(:routines, routines: :category).order("relationships.created_at DESC").page(params[:page]).per(10)
  end

  private

  def move_to_login_page
    flash[:alert] = "ログインが必要です"
    redirect_to new_user_session_path
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :image)
  end

  def correct_user?
    user = User.find(params[:id])
    if user.id != current_user.id
      flash[:alert] = "権限がありません"
      redirect_to user_path(user)
    end
  end

  def admin_user?
    redirect_to root_path unless current_user.admin?
    redirect_to root_path if User.find(params[:id]).admin?
  end
end
