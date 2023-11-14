json.user do
  json.extract! @user, :email, :bio, :created_at, :updated_at
end

