module GamesHelper

  def queenside_rook
    @pieces.where(type: "Rook", user_id: current_user.id, piece_move_count: 0, x_coordinate: 1).first
  end

  def kingside_rook
    @pieces.where(type: "Rook", user_id: current_user.id, piece_move_count: 0, x_coordinate: 8).first
  end

  def king_to_castle
    @pieces.where(type: "King", user_id: current_user.id).first
  end

  def legal_to_castle?(new_king_x_coord, new_king_y_coord)
    king_to_castle.can_castle?(new_king_x_coord, new_king_y_coord)
  end

  def user_game_piece_color
    current_user.id == @game.white_player_id ? "White" : "Black"
  end

  def opponent_game_piece_color
    current_user.id == @game.white_player_id ? "Black" : "White"
  end

  def opponent
    if @game.white_player_id.present? && @game.black_player_id.present?
      if current_user.id == @game.white_player_id
        gameOppId = @game.black_player_id 
        opponent = User.find(gameOppId)
        return opponent
      elsif current_user.id == @game.black_player_id
        gameOppId = @game.white_player_id 
        opponent = User.find(gameOppId)
        return opponent
      end
    else
      return nil
    end
  end

  def open_game_opponent(game)
    opponent_id = game.user_id
    return User.find(opponent_id)
  end

  def opponent_won_amt(game)
    return open_game_opponent(game).games.where(state: "won").count
  end

  def opponent_lost_amt(game)
    return open_game_opponent(game).games.where(state: "lost").count
  end

  def opponent_game_amt(game)
    return open_game_opponent(game).games.count
  end

  def game_turn_username
    if @game.game_turn == current_user.id
      return current_user.username
    else 
      return opponent.username
    end
  end

  

end
