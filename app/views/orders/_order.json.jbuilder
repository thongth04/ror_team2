json.extract! order, :id, :name, :address, :phone, :pay_type, :oder_form, :created_at, :updated_at
json.url order_url(order, format: :json)
