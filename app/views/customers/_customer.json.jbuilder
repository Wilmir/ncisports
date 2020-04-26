json.extract! customer, :id, :name, :email, :address, :admin, :created_at, :updated_at
json.url customer_url(customer, format: :json)
