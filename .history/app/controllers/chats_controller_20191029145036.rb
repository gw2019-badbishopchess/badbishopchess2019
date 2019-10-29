class ChatsController < ApplicationController

  def index
      @chats = Chat.all
      @chat = Chat.new
    end

    def new
      @chat = Chat.new
    end

    def create
        @chat = Chat.new(chat_params)
        @chat.save
        @chat.save
            format.html { redirect_to @chat, notice: 'Message was successfully posted.' }
            format.json { render :show, status: :created, location: @chat }
      end

  private

  def chat_params
    params.require(:chat).permit(:username, :user_id, :message, :created_at, :game_id, :id)
  end
end
