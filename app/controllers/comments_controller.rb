class CommentsController < ApplicationController

  def index
  	@wiki = Wiki.find(params[:wiki_id])
    @comments = @wiki.comments.paginate(:page => params[:page])
    @title = "All comments"
  end

  def create
  	@wiki = Wiki.find(params[:wiki_id])
    @comment = @wiki.comments.build(params[:comment])
    if @comment.save
      redirect_to @wiki, :flash => { :success => "Comment posted!" }
    else
      redirect to root_path
    end
  end
end