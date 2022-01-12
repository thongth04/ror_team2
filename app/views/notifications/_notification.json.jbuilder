json.extract! notification, :id, :content, :user_id, :order_id, :created_at, :updated_at
json.url notification_url(notification, format: :json)
