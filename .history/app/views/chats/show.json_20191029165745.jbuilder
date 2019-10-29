json.extract! @chat, :id, :username, :message
json.url chat_url(@chat.game, format: :json)