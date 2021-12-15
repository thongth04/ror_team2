class Order < ApplicationRecord
    # has_many :cart_items, :dependent => :destroy
    PAYMENT_TYPES = [ "Thanh Toán Trực Tuyến", "Thanh Toán Tiền Mặt" ]
    ODERS_FORM = [ "Đặt Giao Hàng", "Đặt Đến Lấy" ]

    validates :name, :address, :phone, :pay_type, :oder_form,:presence => true
    validates :pay_type, :inclusion => PAYMENT_TYPES
    validates :oder_form, :inclusion => ODERS_FORM

    # def add_cart_items_from_cart(cart) 
    #     cart.cart_items.each do |product|
    #         cart.cart_id = nil
    #         cart_items << product
    #     end
    # end
end
