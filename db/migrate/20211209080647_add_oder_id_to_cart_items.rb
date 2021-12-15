class AddOderIdToCartItems < ActiveRecord::Migration[6.1]
  def change
    add_column :cart_items, :oder_id, :integer
  end
end
