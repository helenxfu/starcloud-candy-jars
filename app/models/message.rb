class Message < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :body, presence: true
  scope :custom_display, -> { order(:created_at).last(20) }
end
