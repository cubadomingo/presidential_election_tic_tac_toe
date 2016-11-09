class GameController < ApplicationController
  before_filter :set_game

  def index
  end

  def move
    if @grid.move!(params[:row],params[:location],params[:play])
      if @grid.won?
        @game.winner = @game.turn
        @game.save
        redirect_to root_path(id: params[:id])
      else
        @game.next_player
        redirect_to root_path(id: params[:id])
      end
    else
      flash[:danger] = "Sorry something went wrong!"
    end
  end

  private
  def set_game
    if params[:id]
      @game = Game.find(params[:id])
      @grid = @game.grid
    else
      @grid = Grid.create
      @game = Game.create(grid_id: @grid.id)
    end
  end

  def game_params
    params.require(:game).permit(:id, :location, :play)
  end
end
