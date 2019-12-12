require "test_helper"

class PostTest < ActiveSupport::TestCase
  def setup
    @post = posts(:valid)
  end

  test "valid post" do
    assert @post.valid?
  end

  test "invalid without user" do
    post = posts(:without_user)
    refute post.valid?, "Post is valid without a user"
    assert_not_nil post.errors[:user], "No validation error for user"
  end

  test "invalid without title" do
    post = posts(:without_title)
    refute post.valid?, "Post is valid without a title"
    assert_not_nil post.errors[:title], "No validation error for title"
  end

  test "invalid without body" do
    post = posts(:without_body)
    refute post.valid?, "Post is valid without a body"
    assert_not_nil post.errors[:body], "No validation error for body"
  end

  test '#comments' do
    assert_equal 7, @post.comments.size
  end
end
