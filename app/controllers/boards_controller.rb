class BoardsController < ApplicationController
  def index
    redirect_to board_path(Board.first)
  end

  def show
    @board = Board.includes(lanes: :cards).find(params[:id])
  end
end
