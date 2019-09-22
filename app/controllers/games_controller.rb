class GamesController < ApplicationController
  before_action :authenticate_user!

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(game_params)
    byebug
    redirect_to game_path(@game)
  end

  def show
    @game = Game.find(params[:id])
  end

  def index
    @games = Game.all
  end

  def update
    @game = Game.find(params[:id])
    @game.update_attributes(game_params)
  end

  private

  def game_params
    params.require(:game).permit(:name, :user_id)
  end
end
