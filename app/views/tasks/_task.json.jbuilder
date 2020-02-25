json.extract! task, :id, :flow_id, :user_id, :status, :title, :description, :backgroundImage, :time, :created_at, :updated_at
json.url task_url(task, format: :json)
