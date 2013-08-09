class Post < ActiveRecord::Base


  attr_accessible :content, :title, :state_event, :tags_attributes
 
  validates :title, :presence => true,
                    :length => { :minimum => 5 }

  has_many :comments, :dependent => :destroy
  has_many :tags

  state_machine :state, :initial => :private do
    state :private
    state :public

    event :publicate do
      transition :private => :public
    end

    event :privatisation do
      transition :public => :private
    end
  end

  #TODO add tags
  # accepts_nested_attributes_for :tags, :allow_destroy => :true,
  #   :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end