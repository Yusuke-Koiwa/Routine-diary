class CommentsController < ApplicationController

def create
  @comment = Comment.new(comment_params)
  @user_image_url = @comment.user_image_url(@comment.user)
  if @comment.save
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

end
