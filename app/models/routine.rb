class Routine < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :user

  validates :content, :category_id, presence: true
  validate :routines_number, on: :create

  def routines_number
    errors.add(:routine, "登録できる習慣は3つまでです") if user && user.routines.count >= 3
  end
end
