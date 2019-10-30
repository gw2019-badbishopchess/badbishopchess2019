class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @games = current_user.games
    @game = current_user.game.find_by_id(params[:id])
  end
end
