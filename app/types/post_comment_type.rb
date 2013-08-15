class PostCommentType < Post::Comment
  include ApplicationType

  attr_accessible :body, :commenter
  validates :body, :presence => true, :length => { :maximum => 1000  }
end