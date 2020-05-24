class Task < ApplicationRecord
  belongs_to :user
  has_many :routine_logs
  has_many :comments, dependent: :destroy
  has_many :praises, dependent: :destroy
  has_many :praised_users, through: :praises, source: :user
  validates :user_id, presence: true

  def create_routine_log(user)
    user.routines.each do |r|
      self.routine_logs.create(category_id: r.category_id, content: r.content)
    end
  end
end
