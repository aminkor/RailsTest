require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:valid)
  end

  test "valid user" do
    assert @user.valid?
  end

  test "invalid without email" do
    user = users(:no_email)
    refute user.valid?, "User is valid without an email"
    assert_not_nil user.errors[:email], "No validation error for email"
  end


  test "invalid with wrong email format" do
    user = users(:invalid_email_format)
    refute user.valid?, "User is valid with wrong formatted email"
    assert_not_nil user.errors[:email], "No validation error for email"
  end

  test '#posts' do
    assert_equal 3, @user.posts.size
  end
end
