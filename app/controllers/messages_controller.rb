class MessagesController < ApplicationController
  before_action :require_user

  def create
    message = current_user.messages.new(message_params)
    if message.save
      # redirect_back(fallback_location: root_url)
      ActionCable.server.broadcast "chatroom_channel", mod_message: message_render(message)
    else
      flash[:danger] = "Message create failed: #{message.errors.full_messages}"
      redirect_back(fallback_location: root_url)
    end
  end

  def destroy
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def message_render(message)
    render(partial: 'message', locals: {message: message})
  end
end
