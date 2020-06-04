class RoutineLog < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to :task

  validates :content, :date, :category_id, presence: true
end
