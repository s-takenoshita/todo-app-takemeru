class BoardsController < ApplicationController

  def index
    # render 'board/index'
    @boards = Board.all
  end

  def show
    @board = current_user.boards.find(params[:id])
  end

  def new
    @board = current_user.boards.build
  end

  def edit
    @board = current_user.boards.find(params[:id])
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
        redirect_to board_path(@board), notice: '保存できました'
    else
        flash.now[:error] = '保存に失敗しました'
        render :new
    end
  end

  def destroy
    board = current_user.boards.find(params[:id])
    board.destroy!
    redirect_to root_path, notice: '削除に成功しました'
  end

  private
    def board_params
        params.require(:board).permit(:name, :description)
    end
end