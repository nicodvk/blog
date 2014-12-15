class PostsController < ApplicationController
  before_action :set_tags, only: [:index, :show]

  def index
  	@posts = Post.all.order('created DESC')
  end

  def show
  	@post = Post.find(params[:id])
  end

  def set_tags
  	@tags = Tag.all
  end
end
