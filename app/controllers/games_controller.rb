class GamesController < ApplicationController

  def index
    @available_games = Game.available.order("created_at DESC")
  end

  def new

  end

  def create

  end

  def show

  end
  
end
