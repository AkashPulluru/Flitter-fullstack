json.extract! user, :id, :username, :email, :password_digest, :full_name, :join_date, :bio, :website, :profile_picture, :session_token, :created_at, :updated_at
json.url user_url(user, format: :json)
