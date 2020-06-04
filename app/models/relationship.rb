class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :follow, class_name: 'User'
  validates_uniqueness_of :follow_id, scope: :user_id
end
