class Task < ApplicationRecord
  belongs_to :user
  has_many :praises
  has_many :praised_users, through: :likes, source: :user
  validates :user_id, presence: true
end
