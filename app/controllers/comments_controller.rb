class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show

  end

  def new
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new comment_params
    @comment.visible = false
    if @comment.save
      respond_to do |format|
        format.html { redirect_to comments_path }
        format.json { head :no_content }
      end
    else
      render 'new'
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update comment_params
      redirect_to comments_path
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_path
  end

private
  def comment_params
    params.require(:comment).permit(:content, :visible)
  end
end
