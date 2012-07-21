class Wiki < ActiveRecord::Base
  attr_accessible :name, :content
  
  validates :name, :presence => true,
                   :length   => { :maximum => 50 }
end
