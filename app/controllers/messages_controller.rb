class MessagesController < ApplicationController
  acts_as_token_authentication_handler_for User, only: [:create, :destroy]  
  before_action :set_conversation, only: [:index, :create]
  before_action :set_message, only: [:show, :destroy]

  def create
    @message = @conversation.messages.build(message_params)
    
    if @message.save
      render :show, status: :created
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @message.destroy
  end

  private
    def set_conversation
      @user = User.find(params[:conversation_id])
      @conversation = Conversation.get(current_user.id, @user.id)
    end

    def get_recipient_id
      conversation = Conversation.get(current_user.id, @user.id)
      conversation.opposed_user(current_user).id
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:body).merge(user_id: current_user.id, recipient_id: get_recipient_id)
    end
end
