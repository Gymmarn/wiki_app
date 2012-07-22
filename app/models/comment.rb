class Comment < ActiveRecord::Base
  attr_accessible :content, :wiki_id
end
