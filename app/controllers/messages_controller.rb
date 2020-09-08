class MessagesController < ApplicationController
  before_action :require_user

  def create
    message = current_user.messages.new(message_params)
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
