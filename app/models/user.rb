class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :tasks, :dependent => :destroy
  has_many :routines, :dependent => :destroy

  mount_uploader :image, ImageUploader

  validates :name, presence: true

  def done_days(tasks)
    sorted_tasks = tasks.where("date <= ?", Date.today)
    day_count = sorted_tasks.where(score: "done").count
  end

  def continuous_days(tasks)
    sorted_tasks = tasks.where("date <= ?", Date.today).order(date: "DESC")
    latest_day = sorted_tasks.first.date

    if latest_day >= Date.yesterday
      num = 0
      calc_continuous_days(sorted_tasks, num)
    else
      return 0
    end    
  end

  def calc_continuous_days(tasks, num)
    tasks.each do |task|
      if task.score != "done"
        return num
      end
      num += 1
    end
    return num
  end

end
