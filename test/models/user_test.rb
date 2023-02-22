require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "user email" do
    user = User.find(1)
    assert_equal("test1@test.com", user.email)
  end

  test "user email false" do
    user = User.find(1)
    assert_not_equal("test2@test.com", user.email)
  end


  test "last user" do
    user = User.last
    assert_equal(1, user.id)
  end

  test "last user false" do
    user = User.last
    assert_not_equal(2, user.id)
  end
end
