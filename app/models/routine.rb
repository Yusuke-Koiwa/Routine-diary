class Routine < ApplicationRecord

  belongs_to :user
  validates :content, :user_id, presence: true

end
