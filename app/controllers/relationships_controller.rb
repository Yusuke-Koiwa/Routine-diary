class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    following = current_user.follow(@user)
    if following.save
      flash[:notice] = "#{@user.name}さんをフォローしました"
      redirect_back(fallback_location: user_path(@user))
    else
      flash[:alert] = "フォローに失敗しました"
      redirect_back(fallback_location: user_path(@user))
    end
  end

  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:notice] = "#{@user.name}さんのフォローを解除しました"
      redirect_back(fallback_location: user_path(@user))
    else
      flash[:alert] = "フォローの解除に失敗しました"
      redirect_back(fallback_location: user_path(@user))
    end
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end

end
