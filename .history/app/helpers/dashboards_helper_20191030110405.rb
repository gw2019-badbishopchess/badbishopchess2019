module DashboardsHelper

  def open_games
    return current_user.games.where(state: "open")
  end

  def won_games
    return current_user.games.where(state: "won")
  end

  def lost_games
    return current_user.games.where(state: "lost")
  end

  def forfeited_games
    return current_user.games.where(state: "forfeited")
  end

  def forfeited_or_lost_games
    return current_user.games.where(state: "forfeited").or(current_user.games.where(state: "lost"))
  end

  def in_progress_games
    return current_user.games.where(state: "in progress")
  end

  def game_opponent
    current_game = @games.find(params[:id])
    if current_game.white_player_id.present? && current_game.black_player_id.present?
      if current_user.id == current_game.white_player_id
        gameOppId = current_game.black_player_id 
        opponent = User.find(gameOppId)
        return opponent
      elsif current_user.id == current_game.black_player_id
        gameOppId = current_game.white_player_id 
        opponent = User.find(gameOppId)
        return opponent
      end
    else
      return nil
    end
  end

end
