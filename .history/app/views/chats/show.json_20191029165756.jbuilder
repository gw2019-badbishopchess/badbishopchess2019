json.extract! @chat, :id, :username, :message, :game_id, :user_id
json.url chat_url(@chat.game, format: :json)