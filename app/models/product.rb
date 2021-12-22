class Product < ApplicationRecord
  extend ProductsHelper

  has_many :cart_items, dependent: :destroy
  has_many :order_items
end

