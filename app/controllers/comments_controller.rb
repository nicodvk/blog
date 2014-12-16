class CommentsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index] 
  before_action :set_comment, only: :destroy
  before_action :set_post

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
    @comment = @post.comments.build comment_params
    @comment.user = current_user
    @comment.visible = false
    @comment.created = DateTime.now
    authorize! :comment, @post

    if @comment.save
      redirect_to post_path(@post, anchor: 'comments'), flash: { success: t('validation.create', model: @comment.class.model_name.human.downcase) }
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
    authorize! :comment, @post
    @comment.destroy
    redirect_to post_path(@post)
  end

private
  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find params[:id]
  end

  def comment_params
    params.require(:comment).permit(:content, :visible, :created)
  end
end
