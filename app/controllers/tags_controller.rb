class TagsController < ApplicationController
  before_action :set_tag, only: [:show]

  def index
  	@tags = Tag.all
  end

  def show
  end

  def destroy
  end

  def set_tag
    @tag = Tag.find params[:slug]
  end
end
