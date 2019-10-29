class ChatsController < ApplicationController

  def index
    @chats = Chat.all
    @chat = Chat.new
  end

  def new
    @chat = Chat.new
  end

  def create
    @chat = Chat.create(chat_params)
    @game = @chat.game_id
    redirect_to game_path(@game)
  end

  private

  def chat_params
    params.require(:chat).permit(:username, :user_id, :message, :created_at, :game_id)
  end
end
