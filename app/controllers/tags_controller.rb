class TagsController < ApplicationController
  include ArticlesHelper
  
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def new
  	@tag = Tag.new
  end

  def create
  	@tag = Tag.new(article_params)
  	@tag.save
  	flash.notice = "Tag '#{@tag.name}' Created!"
  	redirect_to tag_path(@tag)
  end

  before_filter :require_login, only: [:destroy]

  def destroy
  	@tag = Tag.find(params[:id])
  	@tag.destroy
  	flash.notice = "Tag '#{@tag.name}' Deleted!"
  	redirect_to tags_path
  end

end
