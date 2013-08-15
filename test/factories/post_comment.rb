FactoryGirl.define do
  factory 'post/comment' do
    commenter "commenter"
    body "body"
    post
  end
end