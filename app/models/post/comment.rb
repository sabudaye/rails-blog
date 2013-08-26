class Post::Comment < ActiveRecord::Base
  belongs_to :post
  has_ancestry

  attr_accessible :body, :commenter, :parent_id
end
