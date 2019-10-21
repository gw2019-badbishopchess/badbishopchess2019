module GamesHelper

  def queenside_rook
    @pieces.where(type: "Rook", user_id: current_user.id, piece_move_count: 0, x_coordinate: 1).first
  end

  def kingside_rook
    @pieces.where(type: "Rook", user_id: current_user.id, piece_move_count: 0, x_coordinate: 8).first
  end

  def legal_to_castle_kingside?
    @king.can_castle?(@king.x_coordinate + 2, @king.y_coordinate)
  end

  def legal_to_castle_queenside?
    @king.can_castle?(@king.x_coordinate - 2, @king.y_coordinate)
  end
end
