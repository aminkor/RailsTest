require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @comment = comments(:valid)
  end

  test "valid comment" do
    assert @comment.valid?, "Invalid comment"
  end

  test "invalid without post" do 
    comment = comments(:without_post)
    refute comment.valid?, "Comment is valid without a post"
    assert_not_nil comment.errors[:post], "No validation error for post"
  end

  test "invalid without body" do 
    comment = comments(:without_body)
    refute comment.valid?, "Comment is valid without body"
    assert_not_nil comment.errors[:body], "No validation error for body"
  end

  test "invalid without name" do 
    comment = comments(:without_name)
    refute comment.valid?, "Comment is valid without name"
    assert_not_nil comment.errors[:name], "No validation error for name"
  end

  test "invalid without email" do 
    comment = comments(:without_email)
    refute comment.valid?, "Comment is valid without email"
    assert_not_nil comment.errors[:email], "No validation error for email"
  end

  test "invalid with wrongly formatted email" do 
    comment = comments(:invalid_email)
    refute comment.valid?, "Comment is valid with wrongly formatted email"
    assert_not_nil comment.errors[:email], "No validation error for email"
  end
end
