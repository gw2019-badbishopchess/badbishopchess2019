require 'rails_helper'

RSpec.describe Game, type: :model do
  before :each do
    user = FactoryBot.create(:user)
  end

  describe '#populate_board!' do
    it "should put 32 pieces on the board" do
      game = FactoryBot.create(:game)
      expect(game.pieces.count).to eq(32) 
    end
  end
end
