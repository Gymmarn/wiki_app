require 'nokogiri'
require 'open-uri'

class Wiki < ActiveRecord::Base
  attr_accessible :name, :content
  
  has_many :comments
  
  name_regexp = /\A[a-zA-Z\s\:\(\)]+\z/i
  
  validates :name, :presence => true,
                   :length     => { :maximum => 50 },
                   :format     => { :with => name_regexp },
		   :uniqueness => { :case_sensitive => false }

  before_save :get_content
end

def get_content
  self.content = Nokogiri::HTML(open("http://en.wikipedia.org/wiki/#{@wiki.name.gsub!(' ','_')}"))
end