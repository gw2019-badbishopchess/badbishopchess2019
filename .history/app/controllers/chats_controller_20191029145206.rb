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
        if @chat.save
          render 'show.json.jbuilder'
        else
          head 400
        end
      end

  private

  def chat_params
    params.require(:chat).permit(:username, :user_id, :message, :created_at, :game_id, :id)
  end
end
