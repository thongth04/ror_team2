class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.string :type
      t.integer :quantity
      t.string :image_url

      t.timestamps
    end
  end
end
