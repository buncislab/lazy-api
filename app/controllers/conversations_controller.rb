class ConversationsController < ApplicationController
  acts_as_token_authentication_handler_for User, only: [:index, :show]  
  before_action :set_conversation, only: [:show]

  def index
    @conversations = Conversation.involving(current_user)
  end

  def show
    @messages = @conversation.messages
  end

  private
    def set_conversation
      @user = User.find(params[:id])
      @conversation = Conversation.get(current_user.id, @user.id)
    end
end
