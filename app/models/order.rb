class Order < ApplicationRecord
    belongs_to :user
    has_many :notifications
    has_many :order_items, dependent: :destroy
    has_many :notifications, as: :notificationable

    PAYMENT_TYPES = [ "Thanh Toán Trực Tuyến", "Thanh Toán Tiền Mặt" ]
    ORDERS_FORM = [ "Đặt Giao Hàng", "Đặt Đến Lấy" ]

    validates :name, :address, :phone, :pay_type, :order_form, :presence => true
    validates :pay_type, :inclusion => PAYMENT_TYPES
    validates :order_form, :inclusion => ORDERS_FORM
    
end
