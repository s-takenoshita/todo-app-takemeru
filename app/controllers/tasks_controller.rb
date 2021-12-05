class TasksController < ApplicationController

  def show
  end

  def new
    board = Board.find(params[:board_id])
    @task = board.tasks.build
  end

  def edit
  end

  def update
  end

  private
  def task_params
    params.require(:task).permit(:title, :content, :deadline, :board_id)
end
end