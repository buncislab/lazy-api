json.extract! conversation, :id, :recipient_id, :sender_id
json.last_message conversation.messages.first.body if conversation.messages.any?
json.last_message_date conversation.messages.first.created_at.strftime("%I:%M %p") if conversation.messages.any?
json.recipient_name conversation.opposed_user(current_user).username
json.recipient_idnya conversation.opposed_user(current_user).id
