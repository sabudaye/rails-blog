require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "should not be empty" do
    comment = Comment.new
    assert !comment.save
  end

  test "should not be ambiguously" do
    comment = Comment.new(
      :commenter => "TestCommenter",
      :body => "test_body" * 10**3 )
    assert !comment.save
  end
end
