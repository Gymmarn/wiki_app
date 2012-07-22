require 'nokogiri'

class WikisController < ApplicationController
  
  def show
    @wiki = Wiki.find(params[:id])
    @title = @wiki.name
  end
  
  def new
    @wiki = Wiki.new
    @title = "Find a Wiki"
  end
  
  def create
    @wiki = Wiki.new(params[:wiki])
    if @wiki.save
      # content = Nokogiri::HTML(RestClient.get("#{http://en.wikipedia.org/} #{wiki.name.underscore}"))   
      redirect_to @wiki
    else 
      @title = "Find a Wiki"
      render 'new'
    end
  end
end
