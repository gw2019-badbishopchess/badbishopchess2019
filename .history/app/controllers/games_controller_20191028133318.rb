class GamesController < ApplicationController
  before_action :authenticate_user!

  def new
    @game = Game.new
  end

  def create
    @game = current_user.games.create(game_params)
    redirect_to game_path(@game)
  end

  def show
    @game = Game.find_by_id(params[:id])
    @pieces = @game.pieces
    @chat = Chat.new
    @chats = Chat.all
  end

  def index
    @unmatched_games = Game.where(:state => 'open')
  end

  def update
    @game = Game.find_by_id(params[:id])
    @game.update_attributes(game_params)
  end

  def join
    @game = Game.find_by_id(params[:id])
    if current_user.id != @game.white_player_id
      @game.update_attributes(game_params)
       redirect_to game_path(@game)
    else
      flash[:alert] = "Error: You are already a player in this game!!" 
      redirect_to games_path
    end
  end

  def forfeit
    @games = Game.find_by_id(params[:id])
    @games.update_attributes(game_params)
    redirect_to games_path
  end

  private

  def game_params
    params.require(:game).permit(:name, :user_id, :white_player_id, :black_player_id, :state, :winning_user_id, :username)
  end

end
