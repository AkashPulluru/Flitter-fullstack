json.user do
  json.extract! @user, :id, :email, :bio, :website, :session_token, :first_name, :last_name
  @json
end

