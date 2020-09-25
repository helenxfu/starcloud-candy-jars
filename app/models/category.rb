class Category < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :name, presence: true, uniqueness: { scope: :user_id }, length: { maximum: 25 }
  has_many :task_categories
  has_many :tasks, through: :task_categories
end
