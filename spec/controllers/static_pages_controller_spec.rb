require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe "static_pages#index" do
    it "should succesfuly show index" do
      user = FactoryBot.create(:user)
      sign_in user
      get :index
      expect(response).to have_http_status(:success)
    end
  end
  
end
