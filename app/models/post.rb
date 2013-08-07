class Post < ActiveRecord::Base
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

  attr_accessible :content, :name, :title, :state, :tags_attributes
 
  validates :name,  :presence => true
  validates :title, :presence => true,
                    :length => { :minimum => 5 }
  validates :state,  :presence => true,
            :format => { :with => /public|private/ }
 
  has_many :comments, :dependent => :destroy
  has_many :tags
 
  accepts_nested_attributes_for :tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end