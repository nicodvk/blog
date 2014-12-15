class PostsController < ApplicationController
  before_action :set_tags, only: [:index, :show]

  def index
  	@posts = Post.order('created DESC').paginate(:page => params[:page], :per_page => 5)
  end

  def show
  	@post = Post.find(params[:id])
  end

  def set_tags
  	@tags = Tag.all
  end
end
