require 'rails_helper'

RSpec.describe King, type: :model do
  it 'should exist' do
    game = Game.create(user_id: 2, white_player_id: 2, black_player_id: 6)
    game.pieces.where(type: 'King').count == 2
  end
  it "sees if white king puts itself in check with move" do
    User.create(id: 2)
    User.create(id: 6)
    game = Game.create(white_player_id: 2, black_player_id: 6)
    white_king = King.create(x_coordinate: 3, y_coordinate: 4, color_white: true)
    black_rook = Rook.create(x_coordinate: 5, y_coordinate: 8, color_white: false)
    treat = white_king.check(4, 4)
    expect(treat).to be true
  end
  it "sees if black king puts itself in check with move" do
  end
end
