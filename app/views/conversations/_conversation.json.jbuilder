json.extract! conversation, :id, :recipient_id, :sender_id
json.last_message conversation.messages.first.body
json.last_message_date conversation.messages.first.created_at.strftime("%I:%M %p")
json.recipient_name conversation.opposed_user(current_user).username