class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :task
  has_many :notifications, dependent: :destroy

  validates :content, presence: true

  def user_image_url(user)
    if self.user.image?
      user.image.url
    else
      "/default.jpg"
    end
  end
end
