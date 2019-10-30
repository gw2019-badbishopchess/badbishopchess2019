class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @game = current_user.game.find_by_id(params[:id])
  end
end
