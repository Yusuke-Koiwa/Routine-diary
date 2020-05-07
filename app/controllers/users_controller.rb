class UsersController < ApplicationController
  before_action :move_to_root_path, unless: :user_signed_in?
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :correct_user?, only: [:edit, :update, :destroy]

  def show
    @tasks = @user.tasks
    @done_days = @user.done_days(@tasks)
    @continuous_days = @user.continuous_days(@tasks)
    @routines = @user.routines
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
