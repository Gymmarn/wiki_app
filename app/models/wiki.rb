require 'nokogiri'
require 'open-uri'

class Wiki < ActiveRecord::Base
  attr_accessible :name, :content
  
  has_many :comments
  
  name_regexp = /\A[a-zA-Z1-9\s\:\(\)]+\z/i
  
  validates :name, :presence => true,
                   :length     => { :maximum => 50 },
                   :format     => { :with => name_regexp },
		   :uniqueness => { :case_sensitive => false }
		   
#  validates_with ContentValidator, :fields => [:name]
  
  default_scope :order => 'wikis.name ASC'

  before_save :get_content
  
end

def get_content
  wiki_url = "http://en.wikipedia.org/wiki/#{name.gsub(' ','_')}"
  page = Nokogiri::HTML(open(wiki_url))
  self.content = page.css('p')[0].text
end

#class ContentValidator < ActiveModel::Validator
#  def validate(name)
#    if error(name)?
#      name.errors[:base] << "No such Wikipedia entry"
#    end
#  end

#  def error(name)
#    begin
#      wiki_url = "http://en.wikipedia.org/wiki/#{name.gsub(' ','_')}"
#      page = Nokogiri::HTML(open(wiki_url))
#      return false
#    rescue Exception => e
#      return true
#    end
#  end
#end