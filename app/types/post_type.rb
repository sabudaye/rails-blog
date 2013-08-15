class PostType < Post

  include ApplicationType
  
  attr_accessible :content, :title, :state_event, :tags_attributes

  validates :title, :presence => true,:length => { :minimum => 5 }
  validates :content, :presence => true, :length => { :minimum => 5 }
end