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
		   
  #validates_with ContentValidator
  
  default_scope :order => 'wikis.name ASC'

  before_save :get_content
  
end

def get_content
  wiki_url = "http://en.wikipedia.org/wiki/#{name.gsub(' ','_')}"
  page = Nokogiri::HTML(open(wiki_url))
  self.content = "#{page.css('p')[0].text} \n\n #{page.css('p')[1].text} \n\n #{page.css('p')[2].text}"
end

def get_info
  return "Wiki name: #{:name}\n Created at: #{:created_at}"
end
#class ContentValidator < ActiveModel::Validator
#  def validate(record)
#    if error(record.name)
#      record.errors[:base] = "No such Wikipedia entry"
#    end
#  end
#  
#  private
#
#	def error(name)
#	  begin
#	    wiki_url = "http://en.wikipedia.org/wiki/#{name.gsub(' ','_')}"
#	    page = Nokogiri::HTML(open(wiki_url))
#        return false
#	  rescue Exception => e
#	    return true
#	  end
#	end
#end