  json.extract! @chat, :id, :username, :message, :game_id
  json.url chat_url(@chat, format: :json)