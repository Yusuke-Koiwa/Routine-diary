class Category < ApplicationRecord
  has_many :routine_logs
  has_many :tasks, through: :routine_logs
end
