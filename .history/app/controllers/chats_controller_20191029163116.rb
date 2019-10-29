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
      respond_to do |format|
        if @chat.save
          format.html { redirect_to @chat.game, notice: 'Message was successfully posted.' }
          format.json { render :show, status: :created, location: @chat }
        else
          format.html { render :new }
          format.json { render json: @chat.errors, status: :unprocessable_entity }
        end
    end

  private

  def chat_params
    params.require(:chat).permit(:username, :user_id, :message, :created_at, :game_id, :id)
  end
end