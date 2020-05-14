class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :task
  validates :content, presence: true
end
