class Routine < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :user

  validates :content, :category_id, presence: true
  validate :routines_number, on: :create

  def routines_number
    if user && user.routines.count >= 3
      errors.add(:routine, "登録できる習慣は3つまでです")
    end
  end
end
