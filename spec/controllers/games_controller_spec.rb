require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe "games#index action" do
    it "should successfully show the page" do
      user = FactoryBot.create(:user)
      sign_in user
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

  describe "games#update action" do
    it "should add current user's id as black_player_id" do
      user = FactoryBot.create(:user)
      sign_in user
      game = FactoryBot.create(:game)
      patch :update, params: { id: game.id }
      expect(response).to redirect_to game_path(game)
      game.reload
      expect(game.black_player_id).to eq user.id
    end
  end
  
end