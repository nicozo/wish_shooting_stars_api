class Wish < ApplicationRecord
  VALID_WISH_REGEX = /欲しい\z|ほしい\z|下さい\z|ください\z|ように\z/
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { maximum: 15 }, format: { with: VALID_WISH_REGEX }

  scope :successful_wishes, -> (number) { where('score = ?', number ).order(created_at: :desc) }
end
