json.extract! task, :id, :user_id, :main_category_id, :title, :body, :delivery_address, :pickup_address, :price, :pickup_time, :status, :driver_id, :created_at, :updated_at
json.url task_url(task, format: :json)
