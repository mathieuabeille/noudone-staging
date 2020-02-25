json.extract! image, :id, :user_id, :flow_id, :task_id, :image, :title, :description, :created_at, :updated_at
json.url image_url(image, format: :json)
