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
      Pusher.trigger('chat', 'new', {
        self.as_json
      })
    end

  private

  def chat_params
    params.require(:chat).permit(:username, :user_id, :message, :created_at, :game_id, :id)
  end
end
