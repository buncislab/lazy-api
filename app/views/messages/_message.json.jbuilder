json._id message.id
json.text message.body
json.createdAt message.created_at
json.user do
  json._id message.user_id
  json.name message.user.username
  json.avatar 'https://facebook.github.io/react/img/logo_og.png'
end
