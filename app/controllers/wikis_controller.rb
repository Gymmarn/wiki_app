class WikisController < ApplicationController
  
  def show
    @wiki = Wiki.find(params[:id])
    @title = @wiki.name
  end
  
  def new
    @wiki = Wiki.new
    @title = "Find a Wiki"
  end  
end
