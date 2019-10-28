class ChatroomsController < ApplicationController
  before_action :authenticate_user!

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = current_user.chatroom.create(chatroom_params)
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:creator_id, :game_id)
  end
end
