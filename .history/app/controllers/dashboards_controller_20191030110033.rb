class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @games = current_user.games
    @game = current_user.games.find(params[:id])
  end
end
