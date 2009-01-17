require File.dirname(__FILE__) + '/../../../../test/test_helper'

class CommentTest < Test::Unit::TestCase
  def test_comment_validations
    # Validation #1: commentable object should be provided
    c = Comment.new
    assert_equal false, c.valid?
    
    # Validation #2: commentor_type should be provided if commentor_id is provided
    c = Comment.new
    c.commentable = users(:user1)
    c.commentor_id = users(:user1).id
    assert_equal false, c.valid?
  end
  
  def test_new_comment
    c = Comment.new
    c.commentable = users(:user1)
    assert_equal true, c.save
    assert_equal users(:user1).name, c.commentable.name
  end
end