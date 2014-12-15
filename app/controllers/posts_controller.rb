class PostsController < ApplicationController
  before_action :set_tags, only: [:index, :show]

  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  end

  def set_tags
  	@tags = Tag.all
  end
end
