class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.text :content
      t.integer :user_id
      t.integer :order_id
      
      t.timestamps
    end
  end
end
