class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create,]

  def new
    task = Task.find(params[:task_id])
    @comment = task.comments.build
  end

  def create
    task = Task.find(params[:task_id])
    @comment = task.comments.build(comments_params)
    if @comment.save
      redirect_to board_task_path(task), notice: 'コメントを追加しました。'
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