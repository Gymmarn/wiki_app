class WikisController < ApplicationController
  
  def index
    @wikis = Wiki.paginate(:page => params[:page])
    @title = "All articles"
  end
  
  def show
    @wiki = Wiki.find(params[:id])
    @comment = Comment.new
    @comments = @wiki.comments.paginate(:page => params[:page])
    @title = @wiki.name
  end
  
  def new
    @wiki = Wiki.new
    @title = "Find a Wiki"
  end
  
  def create
    @wiki = Wiki.new(params[:wiki])
    if @wiki.save
      redirect_to @wiki
    else 
      @title = "Find a Wiki"
      render 'new'
    end
  end
end

