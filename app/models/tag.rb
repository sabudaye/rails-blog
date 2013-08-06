class Tag < ActiveRecord::Base
  belongs_to :post
  attr_accessible :name

  validates :name, :presence => true,
            :length => { :minimum => 2, :maximum => 10  }
end
