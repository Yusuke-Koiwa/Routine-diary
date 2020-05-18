class UsersController < ApplicationController
  before_action :move_to_root_path, unless: :user_signed_in?
  before_action :set_user
  before_action :correct_user?, only: [:edit, :update, :destroy]

  def show
    @tasks = @user.tasks
    @routines = @user.routines
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
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "退会しました。またのご利用をお待ちしております。"
    redirect_to root_path
  end

  def praises_index
    @praised_tasks = @user.praised_tasks.order("praises.created_at DESC").page(params[:page]).per(10)
  end

  def follow_index
    @follow_users = @user.follow_users.includes(:routines).order("relationships.created_at DESC").page(params[:page]).per(10)
  end

  def follower_index
    @follower_users = @user.follower_users.includes(:routines).order("relationships.created_at DESC").page(params[:page]).per(10)
  end

  private
  def move_to_root_path
    flash.now[:alert] = "ログインが必要です"
    render "welcome/home"
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

end
