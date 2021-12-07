class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  attribute :quantity, default: 1
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
