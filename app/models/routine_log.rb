class RoutineLog < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :task

  validates :content, :date, :category_id, presence: true
end
