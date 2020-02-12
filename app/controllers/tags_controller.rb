class TagsController < ApplicationController
  def show
    @tag = Tag.find params[:id]
  end

  def index
    @tags = Tag.order :name
  end
end
