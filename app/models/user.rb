class User < ApplicationRecord
  acts_as_token_authenticatable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true

  has_many :messages

  def generate_authentication_token!
    self.update(authentication_token: Devise.friendly_token)
  end

  def conversations
    Conversation.involving(self)
  end

end
