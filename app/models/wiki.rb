class Wiki < ActiveRecord::Base
  attr_accessible :name, :content
  
  has_many :comments
  
  validates :name, :presence => true,
                   :length   => { :maximum => 50 }
end
