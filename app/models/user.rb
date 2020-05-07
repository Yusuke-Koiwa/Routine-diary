class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :tasks
  has_many :routines

  mount_uploader :image, ImageUploader

  validates :name, presence: true

  def done_days(tasks)
    sorted_tasks = tasks.where("date <= ?", Date.today)
    day_count = sorted_tasks.where(score: "done").count
  end

  def continuous_days(tasks)
    sorted_tasks = tasks.where("date <= ?", Date.today).order(date: "DESC")
    if sorted_tasks.first.date < Date.today - 1
      return 0
    else
      length = sorted_tasks.length
      sorted_tasks.each_with_index do |task, index|
        if task.score != "done"
          return index
        end
        if index == length - 1
          return index + 1
        end
      end
    end
  end

end
