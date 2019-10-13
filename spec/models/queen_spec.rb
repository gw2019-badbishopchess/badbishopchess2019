require 'rails_helper'

RSpec.describe Queen, type: :model do
  before :each do
    user = FactoryBot.create(:user)
    game = FactoryBot.create(:game)
  end

  describe '#is_valid?' do
    it "should see if a move is valid for the queen" do
      
    
    end
  end
end
