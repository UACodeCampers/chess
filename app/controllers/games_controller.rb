class GamesController < ApplicationController

  def index
    @piece = Piece.first
    @game = Game.first 
  end

  def new

  end

  def create

  end

  def show

  end
  
end
