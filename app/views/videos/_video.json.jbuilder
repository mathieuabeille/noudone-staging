json.extract! video, :id, :user_id, :flow_id, :task_id, :video, :title, :description, :created_at, :updated_at
json.url video_url(video, format: :json)
