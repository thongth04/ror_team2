class AddNotifiedToNotifications < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :notified_by_id, :integer
    add_column :notifications, :notificationable_id, :integer
    add_column :notifications, :notificationable_type, :string
    add_column :notifications, :notice_type, :string
    add_column :notifications, :read, :boolean, default: false
    add_column :notifications, :checked, :boolean, default: false
  end
end
