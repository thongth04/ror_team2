class AddDefaultValueToCartTotal < ActiveRecord::Migration[6.1]
  def change
    change_column_default :carts, :total, 0
  end
end
