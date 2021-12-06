class TasksController < ApplicationController

  def show
    board = Board.find(params[:board_id])
    @task = board.tasks.find(params[:id])
  end

  def new
    board = Board.find(params[:board_id])
    @task = board.tasks.build
  end

  def create
    board = Board.find(params[:board_id])
    @task = board.tasks.build(task_params)
    @task.user_id = current_user.id
    if @task.save
      redirect_to board_task_path(board.id, @task.id), notice: '保存できました'
    else
      puts :error
      flash.now[:error] = '保存に失敗しました'
      render :new
    end
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