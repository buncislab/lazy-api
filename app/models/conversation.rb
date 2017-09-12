class Conversation < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
  belongs_to :recipient, foreign_key: :recipient_id, class_name: 'User'

  validates :sender_id, uniqueness: { scope: :recipient_id }
  
  scope :involving, -> (user) do
    where("conversations.sender_id =? OR conversations.recipient_id =?", user.id, user.id)
  end 

  scope :between, -> (sender_id, recipient_id) do
    where(sender_id: sender_id, recipient_id: recipient_id).or(
      where(sender_id: recipient_id, recipient_id: sender_id)
    )
  end
  
  def self.get(sender_id, recipient_id)
    conversation = between(sender_id, recipient_id).first
    if conversation.present?
      return conversation
    else
    conversation = create(sender_id: sender_id, recipient_id: recipient_id)
      return conversation
    end
  end

  def sendername
    self.sender.username
  end
  
  def recipientname
    self.sender.username
  end

  def opposed_user(user)
    user == recipient ? sender : recipient
  end
  
end
