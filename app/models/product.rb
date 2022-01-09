class Product < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_items

  attribute :price, default: 0
  attribute :quantity, default: 0

  VALID_CATEGORIES = ['drink', 'food', 'other']

  validates :title, presence: true, length: { minimum: 5, maximum:40 }
  validates :price, presence: true
  validates :product_type, inclusion: { in: VALID_CATEGORIES }
  validates :quantity, presence: true
  validates :image_url, presence: true


  def self.search(term)
    if term
      where('title LIKE ?', "%#{term}%")
    else
      all
    end
  end

  def self.filter(tag)
    if tag
      where(product_type: tag)
    else
      all
    end
  end

end