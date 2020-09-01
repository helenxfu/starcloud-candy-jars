json.extract! user, :id, :username, :email, :admin, :activated, :created_at, :updated_at
json.url user_url(user, format: :json)
