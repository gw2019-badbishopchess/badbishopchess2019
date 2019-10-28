class Game < ApplicationRecord
  has_many :pieces # Creating game to pieces association
  belongs_to :user # Creating game to users association
  has_one :chatroom

  scope :available, -> { where state: 'open' } # to help find which games are available
  after_create :populate_board!
  after_create :create_chat

  def render_piece(x_coord, y_coord)
    pieces.where('(x_coordinate = ? AND y_coordinate = ?)', x_coord, y_coord)
  end

  def create_chat
    Chatroom.create(game_id: id, creator_id: user_id)
    Chatkit::Client.new({
      instance_locator: 'ENV['CHATKIT_LOCATOR']',
      key: 'ENV['CHATKIT_CHAT_SECRET_KEY']'
    })
  end

  def populate_board!
    #White Pieces
      #Pawns
      (1..8).each do |x_coord|
        Pawn.create(game_id: id, type: Pawn, x_coordinate: x_coord, y_coordinate: 2, color_white: true, user_id: white_player_id)
      end

      #Rooks
      [1,8].each do |x_coord|
        Rook.create(game_id: id, type: Rook, x_coordinate: x_coord, y_coordinate: 1, color_white: true, user_id: white_player_id)
      end

      #Knights
      [2,7].each do |x_coord|
        Knight.create(game_id: id, type: Knight, x_coordinate: x_coord, y_coordinate: 1, color_white: true, user_id: white_player_id)
      end

      #Bishops
      [3,6].each do |x_coord|
        Bishop.create(game_id: id, type: Bishop, x_coordinate: x_coord, y_coordinate: 1, color_white: true, user_id: white_player_id)
      end

      #King
      King.create(game_id: id, type: King, x_coordinate: 5, y_coordinate: 1, color_white: true, user_id: white_player_id)

      #Queen
      Queen.create(game_id: id, type: Queen, x_coordinate: 4, y_coordinate: 1, color_white: true, user_id: white_player_id)
   
    #Black Pieces
      #Pawns
      (1..8).each do |x_coord|
        Pawn.create(game_id: id, x_coordinate: x_coord, y_coordinate: 7, color_white: false, user_id: black_player_id)
      end

      #Rooks
      [1,8].each do |x_coord|
        Rook.create(game_id: id, x_coordinate: x_coord, y_coordinate: 8, color_white: false, user_id: black_player_id)
      end

      #Knights
      [2,7].each do |x_coord|
        Knight.create(game_id: id, x_coordinate: x_coord, y_coordinate: 8, color_white: false, user_id: black_player_id)
      end

      #Bishops
      [3,6].each do |x_coord|
        Bishop.create(game_id: id, x_coordinate: x_coord, y_coordinate: 8, color_white: false, user_id: black_player_id)
      end

      #King
      King.create(game_id: id, x_coordinate: 5, y_coordinate: 8, color_white: false, user_id: black_player_id)

      #Queen
      Queen.create(game_id: id, x_coordinate: 4, y_coordinate: 8, color_white: false, user_id: black_player_id)

  end


end
