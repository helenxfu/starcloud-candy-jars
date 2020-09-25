class Task < ApplicationRecord
  belongs_to :user
  has_many :task_categories
  has_many :categories, through: :task_categories
  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :priority, presence: true
  validates :deadline, presence: true
  validates :user_id, presence: true
end
