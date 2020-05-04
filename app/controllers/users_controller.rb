class UsersController < ApplicationController
  before_action :move_to_root_path, unless: :user_signed_in?

  def show
    @user = User.find(params[:id])
    @tasks = @user.tasks
  end

  private
  def move_to_root_path
    flash.now[:alert] = "ログインが必要です"
    render "welcome/home"
  end
end
