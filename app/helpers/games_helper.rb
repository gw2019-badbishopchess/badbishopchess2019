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

end
