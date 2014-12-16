class CommentsController < ApplicationController
  def index
    @comments = @post.comments
  end

  def show

  end

  def new
    @comment = @post.comments.build
    authorize! :comment, @post
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create!(params[:comment])
    @comment.user = current_user
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
