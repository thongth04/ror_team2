class Product < ApplicationRecord

        def self.fill_out_attr
            products = Product.select{ |product| product[:product_type] != 'drink' }
            for product in products
            product[:product_type] = "food"
            product.save
            end
        end
end
