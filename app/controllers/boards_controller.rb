class BoardsController < ApplicationController

  def index
    # render 'board/index'
    @boards = Board.all
  end

end