json.user_id @comment.user.id
json.user_name @comment.user.name
json.user_image_url @user_image_url
json.created_at @comment.created_at.strftime('%Y/%-m/%-d %-H:%M')
json.content @comment.content
json.comments_count @comment.task.comments.count