class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  scope :rating_desc, -> { order(rating: :desc) }
  scope :rating_asc, -> { order(rating: :asc) }
  
  validates :body, :user, :product, presence: true
  validates :rating, numericality: { only_integer: true}
end