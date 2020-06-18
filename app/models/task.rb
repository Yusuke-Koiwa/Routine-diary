class Task < ApplicationRecord
  belongs_to :user
  has_many :routine_logs, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :praises, dependent: :destroy
  has_many :praised_users, through: :praises, source: :user
  has_many :categories, through: :routine_logs
  has_many :notifications, dependent: :destroy

  validates :date, :start_time, presence: true
  validates :score, presence: true, unless: :body?
  validates :body, presence: true, unless: :score?

  def create_routine_log(user)
    user.routines.each do |r|
      self.routine_logs.create(category_id: r.category_id, content: r.content, date: self.date)
    end
  end

  def create_notification_praise(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and task_id = ? and action = ? ", current_user.id, user_id, id, 'praise'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        task_id: id,
        visited_id: user_id,
        action: 'praise'
      )
       if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  def create_notification_comment(current_user, comment_id)
    temp_ids = Comment.select(:user_id).where(task_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment(current_user, comment_id, temp_id['user_id'])
    end
    save_notification_comment(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment(current_user, comment_id, visited_id)
    notification = current_user.active_notifications.new(
      task_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
