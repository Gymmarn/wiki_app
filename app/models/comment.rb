class Comment < ActiveRecord::Base
  attr_accessible :content
  
  belongs_to :wiki
  
  validates :content, :presence => true, :length => { :maximum => 200 }
  validates :wiki_id, :presence => true
  
  default_scope :order => 'comments.created_at DESC'
end
