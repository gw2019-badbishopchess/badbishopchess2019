require 'rails_helper'



RSpec.describe King, type: :model do
  it 'should exist' do
    game = Game.create(user_id: 2, white_player_id: 2, black_player_id: 6)
    game.pieces.where(type: 'King').count == 2
  end

  describe "#in_check?" do
    it "test if opponent's pieces are the opposite color than theres" do
    end

    it "sees if black king puts itself in check with move" do
    end
  end

  describe ".can_castle?"

  it "should check if king has zero moves" do
  end
  

  
end
