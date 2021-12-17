class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.text :address
      t.string :phone
      t.string :pay_type
      t.string :order_form
      t.integer :total

      t.timestamps
    end
  end
end
