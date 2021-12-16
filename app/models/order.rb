class Order < ApplicationRecord
    # has_many :cart_items, :dependent => :destroy
    belongs_to :user

    PAYMENT_TYPES = [ "Thanh Toán Trực Tuyến", "Thanh Toán Tiền Mặt" ]
    ORDERS_FORM = [ "Đặt Giao Hàng", "Đặt Đến Lấy" ]

    validates :name, :address, :phone, :pay_type, :order_form, :presence => true
    validates :pay_type, :inclusion => PAYMENT_TYPES
    validates :order_form, :inclusion => ORDERS_FORM

    # def add_cart_items_from_cart(cart) 
    #     cart.cart_items.each do |product|
    #         cart.cart_id = nil
    #         cart_items << product
    #     end
    # end
end
