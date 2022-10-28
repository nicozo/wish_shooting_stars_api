class Wish < ApplicationRecord
  validates :title, presence: true, length: { maximum: 15 }

  scope :successful_wishes, -> { where(success: true).order(created_at: :desc) }
end
