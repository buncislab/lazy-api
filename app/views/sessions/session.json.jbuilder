json.extract! @user, :id, :username, :email, :authentication_token
json.url user_url(@user, format: :json)
