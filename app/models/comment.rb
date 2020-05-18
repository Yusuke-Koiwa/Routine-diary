class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :task
  validates :content, presence: true

  def user_image_url(user)
    if self.user.image?
      return user.image.url
    else
      return "/assets/default.jpg"
    end
  end
end
