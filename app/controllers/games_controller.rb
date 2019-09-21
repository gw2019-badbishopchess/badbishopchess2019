class GamesController < ApplicationController
  #before_action :authenticate_user!, only: [:new, :create]

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    @game.save
    redirect_to game_path
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
    params.require(:game).permit(:name)
  end
end
