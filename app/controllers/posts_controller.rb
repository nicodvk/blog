class PostsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index] 
  before_action :set_tags, only: [:index, :show]

  def index
  	@posts = Post.order('created DESC').paginate(:page => params[:page], :per_page => 5)
  end

  def show
  	@post = Post.find(params[:id])
    @comment = Comment.new
  end

  def set_tags
  	@tags = Tag.all
  end
end
