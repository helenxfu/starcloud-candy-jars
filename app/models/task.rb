class Task < ApplicationRecord
  validate :category_count_within_bounds

  belongs_to :user
  has_many :task_categories
  has_many :categories, through: :task_categories
  validates_length_of :categories, maximum: 3
  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :priority, presence: true
  validates :deadline, presence: true
  validates :user_id, presence: true

  private

  def category_count_within_bounds
    errors.add(:base, "Too many categories") if self.categories.count > 3
  end
end
