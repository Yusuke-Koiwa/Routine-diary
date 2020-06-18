class CommentsController < ApplicationController
  before_action :move_to_login_page, unless: :user_signed_in?

def create
  @comment = Comment.new(comment_params)
  @user_image_url = @comment.user_image_url(@comment.user)
  if @comment.save
    @comment.task.create_notification_comment(current_user, @comment.id)
    respond_to do |format|
      format.json
    end
  else
    flash[:alert] = "コメントが入力されていません"
    redirect_back(fallback_location: tasks_path)
  end
end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(task_id: params[:task_id], user_id: current_user.id)
  end

  def move_to_login_page
    flash[:alert] = "ログインが必要です"
    redirect_to new_user_session_path
  end

end
