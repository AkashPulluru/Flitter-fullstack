json.user do
  json.extract! @user, :id, :email, :bio
  @json
end

