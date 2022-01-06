class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  attribute :total, default: 0
end
