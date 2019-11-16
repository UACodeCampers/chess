require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe "games#index action" do
    it "should successfully show the page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
  describe "games#show action" do
    it "should successfully show the page if a game is found" do
      game = FactoryBot.create(:game)
      get :show, params: { id: game.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "games#create action" do
    it "should successfully create a game" do
      game = FactoryBot.create(:game)
    end
  end
end