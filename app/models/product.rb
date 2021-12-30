class Product < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_items

  # attribute :price, default: 0
  # attribute :quantity, default: 0

  # VALID_CATEGORIES = ['Drinks', 'Foods', 'Others']

  # validates :title, presence: true, length: { minimum: 5, maximum:40 }
  # validates :price, presence: true
  # validates :product_type, inclusion: { in: VALID_CATEGORIES }
  # validates :quantity, presence: true
  # validates :image_url, presence: true

end

