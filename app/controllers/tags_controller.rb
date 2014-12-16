class TagsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show] 

  def show
  	@tags = Tag.all
    @tag = Tag.find(params[:id])
    @posts = @tag.posts.order('created DESC').paginate(:page => params[:page], :per_page => 5)
  end
end
