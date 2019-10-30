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

  def opponent
    @game = current_user.game
    if game.white_player_id.nil? && !@game.black_player_id.nil?
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

end
