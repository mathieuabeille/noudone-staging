json.extract! interaction, :id, :user_id, :flow_id, :task_id, :batch_id, :interactionType, :created_at, :updated_at
json.url interaction_url(interaction, format: :json)
