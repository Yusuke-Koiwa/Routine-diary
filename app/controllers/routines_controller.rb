class RoutinesController < ApplicationController
  before_action :move_to_login_page, unless: :user_signed_in?
  before_action :set_routine, only: %i[update destroy]
  before_action :correct_user?, only: %i[update destroy]
  before_action :max_routines?, only: :create

  def create
    @routine = Routine.new(routine_params)
    @routine.save
    redirect_to user_path(current_user)
  end

  def update
    @routine.update(routine_params)
    redirect_to user_path(current_user)
  end

  def destroy
    @routine.destroy
    redirect_to user_path(current_user)
  end

  private

  def move_to_login_page
    flash[:alert] = "ログインが必要です"
    redirect_to new_user_session_path
  end

  def routine_params
    params.require(:routine).permit(:content, :category_id).merge(user_id: current_user.id)
  end

  def set_routine
    @routine = Routine.find(params[:id])
  end

  def correct_user?
    routine = Routine.find(params[:id])
    return if routine.user == current_user

    flash[:alert] = "権限がありません"
    redirect_to user_path(routine.user)
  end

  def max_routines?
    return unless current_user.routines.length >= 3

    flash[:alert] = "登録できる習慣は３つまでです"
    redirect_to user_path(current_user)
  end
end
