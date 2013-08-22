class Post < ActiveRecord::Base


  attr_accessible :content, :title, :state_event
 
  has_many :comments, :dependent => :destroy
  has_many :tags

  state_machine :state, :initial => :draft do
    state :draft
    state :published

    event :publish do
      transition :draft => :published
    end

    event :unpublish do
      transition :published => :draft
    end
  end

  include PostRepository

  accepts_nested_attributes_for :comments
  #TODO add tags
  # accepts_nested_attributes_for :tags, :allow_destroy => :true,
  #   :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end