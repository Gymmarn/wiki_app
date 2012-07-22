require 'rubygems'
require 'nokogiri'
require 'restclient'

page = Nokogiri::HTML(RestClient.get("http://en.wikipedia.org/"))   
@wiki.content = page # => Nokogiri::HTML::Document