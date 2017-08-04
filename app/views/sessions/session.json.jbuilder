json.extract! @user, :email, :authentication_token
json.url user_url(@user, format: :json)
