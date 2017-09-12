class Message < ApplicationRecord
  include FcmClient
  belongs_to :user#, touch: true
  belongs_to :recipient, class_name: 'User'
  belongs_to :conversation
  validates :user_id, presence: true
  validates :recipient_id, presence: true
  validates :conversation_id, presence: true
  after_create :bikin_notif

  def bikin_notif
    self.notif({ 
        title: "you got new message",
        message: {
          "_id": self.id,
          "text": self.body,
          "createdAt": self.created_at,
          "user": {
              "_id": self.user_id,
              "name": self.user.username,
              "avatar": "https://facebook.github.io/react/img/logo_og.png"
          }
      },
        body: self.body, 
        sound: "true"},
      self.recipient.fcm_device_token)
  end
end
