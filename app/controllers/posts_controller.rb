class PostsController < ApplicationController
  before_action :set_tags, only: [:index, :show]

  def index
  	@posts = Post.order('created DESC').paginate(:page => params[:page], :per_page => 5)
  end

  def show
  	@post = Post.find(params[:id])
    @like = @post.likes.include?(current_user.id)
  end

  def like
    @post = Post.find(params[:id])

    if !@post.likes.include?(current_user.id)
      @post.likes << current_user.id
    else
      @post.likes.delete(current_user.id)
    end

    @post.save
    redirect_to @post  
  end

  def set_tags
  	@tags = Tag.all
  end
end
