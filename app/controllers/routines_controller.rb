class RoutinesController < ApplicationController
  before_action :move_to_root_path,  unless: :user_signed_in?
  before_action :set_routine, only: [:update, :destroy]
  before_action :correct_user?, only: [:destroy]

  def create
    if current_user.routines.length >= 3
      flash[:alert] = "登録できる習慣は３つまでです"
      redirect_to user_path(current_user)
    end
    @routine = Routine.new(routine_params)
    if @routine.save
      redirect_to user_path(current_user)
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    if @routine.update(routine_params)
      redirect_to user_path(current_user)
    else
      redirect_to user_path(current_user)
    end
  end

  def destroy
    @routine.destroy
    redirect_to user_path(current_user)
  end

  private
  def move_to_root_path
    flash.now[:alert] = "ログインが必要です"
    render "welcome/home"
  end

  def routine_params
    params.require(:routine).permit(:content).merge(user_id: current_user.id)
  end

  def set_routine
    @routine = Routine.find(params[:id])
  end

  def correct_user?
    routine = Routine.find(params[:id])
    if routine.user.id != current_user.id
      flash[:alert] = "権限がありません"
      redirect_to user_path(routine.user)
    end
  end

end
