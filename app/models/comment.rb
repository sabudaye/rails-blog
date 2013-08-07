class Comment < ActiveRecord::Base
  belongs_to :post
  attr_accessible :body, :commenter

  validates :body, :presence => true,
                    :length => { :maximum => 1000  }
end
