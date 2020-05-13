class CommentsController < ApplicationController

def create
  @comment = Comment.new(comment_params)
  if @comment.save
    redirect_back(fallback_location: tasks_path)
  else
    redirect_back(fallback_location: tasks_path)
  end
end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(task_id: params[:task_id], user_id: current_user.id)
  end

end
