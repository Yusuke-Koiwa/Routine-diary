class Task < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :praises, dependent: :destroy
  has_many :praised_users, through: :praises, source: :user
  validates :user_id, presence: true
end
