class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user
  validates :product_id, :user_id, :presence => true
  # validates_length_of :content, minimum:10, maximum: 250
  # validates_numericality_of :rating, less_than_or_equal_to: 5, greater_than_or_equal_to: 1
  end