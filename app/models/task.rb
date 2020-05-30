class Task < ApplicationRecord
  belongs_to :user
  has_many :routine_logs, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :praises, dependent: :destroy
  has_many :praised_users, through: :praises, source: :user

  validates :date, :start_time, presence: true
  validates :score, presence: true, unless: :body?
  validates :body, presence: true, unless: :score?

  def create_routine_log(user)
    user.routines.each do |r|
      self.routine_logs.create(category_id: r.category_id, content: r.content, date: self.date)
    end
  end
end
