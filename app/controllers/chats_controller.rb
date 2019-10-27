class ChatsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @chat = Chat.new(chat_params)
    respond_to do |format|
      if @chat.save
        format.html { redirect_to @chat, notice: 'Message was successfully posted.' }
        format.json { render :show, status: :created, location: @chat }
      else
        format.html { render :new }
        format.json { render json: @chat.erros, status: :unprocessable_entity }
      end
    end
  end

  private 
    def chat_params
      params.require(:chat).permit(:username, :message)
    end

end
