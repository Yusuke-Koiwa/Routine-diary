class Praise < ApplicationRecord
  belongs_to :task
  belongs_to :user
  validates_uniqueness_of :task_id, scope: :user_id
end
