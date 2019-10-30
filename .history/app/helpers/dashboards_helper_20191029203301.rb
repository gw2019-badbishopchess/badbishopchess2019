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
    return current_user.games.where(state: "lost")
  end

  def oppenent_username
    return 
  end

end
