class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create,]

  def new
    task = Task.find(params[:task_id])
    @comment = task.comments.build
  end

  def edit
    task = Task.find(params[:task_id])
    @comment = task.comments.find(params[:id])
  end

  def update
    task = Task.find(params[:task_id])
    @comment = task.comments.find(params[:id])
    if @comment.update(comments_params)
      redirect_to board_task_path(task.board_id, task.id), notice: '更新できました'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end

  def create
    task = Task.find(params[:task_id])
    @comment = task.comments.build(comments_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to board_task_path(task.board_id, task), notice: 'コメントを追加しました。'
    else
      flash.now[:error] = '保存に失敗しました。'
        render :new
    end
  end

  private
  def comments_params
    params.require(:comment).permit(:content)
  end
end