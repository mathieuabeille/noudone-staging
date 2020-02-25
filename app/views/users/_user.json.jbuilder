json.extract! user, :id, :firstName, :lastName, :nickName, :email, :password, :avatarUrl, :created_at, :updated_at
json.url user_url(user, format: :json)
