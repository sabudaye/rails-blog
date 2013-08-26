module CommentsHelper
  def nested_comments(comments)
    comments.map do |comment, sub_comments|
      render 'web/posts/comments/comment', comment: comment
    end.join.html_safe
  end
end
