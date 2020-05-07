class RoutinesController < ApplicationController
  before_action :move_to_root_path,  unless: :user_signed_in?
  before_action :set_routine, only: [:edit, :update, :destroy]
  before_action :correct_user?, only: [:edit, :update, :destroy]

  def new
    @routine = Routine.new
  end

  def create
    @routine = Routine.new(routine_params)
    if @routine.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @routine.update(routine_params)
      redirect_to user_path(current_user)
    else
      render :edit
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
