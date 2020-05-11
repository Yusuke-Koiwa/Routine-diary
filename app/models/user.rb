class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :tasks, dependent: :destroy
  has_many :routines, dependent: :destroy
  has_many :praises, dependent: :destroy
  has_many :praised_tasks, through: :praises, source: :task

  mount_uploader :image, ImageUploader

  validates :name, presence: true

  def done_days(tasks)
    sorted_tasks = tasks.where("date <= ?", Date.today)
    day_count = sorted_tasks.where(score: "done").count
  end

  def continuous_days(tasks)
    tasks = tasks.where("date <= ?", Date.today).order(date: "DESC")
    return 0 unless tasks.exists?
    return 0 if tasks.first.score == "bad"
    tasks = tasks.where(score: "done")
    latest_day = tasks.first.date

    if latest_day >= Date.yesterday
      num = 0
      calc_continuous_days(tasks, num)
    else
      return 0
    end    
  end

  def calc_continuous_days(tasks, num)
    calc_day = tasks.first.date
    tasks.each do |task|
      if calc_day - task.date != 0
        return num
      end
      num += 1
      calc_day -= 1
    end
    return num
  end

  def already_praised?(task)
    self.praises.exists?(task_id: task.id)
  end

end
