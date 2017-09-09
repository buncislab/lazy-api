json.partial! "conversations/conversation", conversation: @conversation
json.messages @conversation.messages, :id, :recipient_id, :user_id, :body, :created_at