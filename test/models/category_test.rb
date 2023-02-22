require "test_helper"

class CategoryTest < ActiveSupport::TestCase

  test "first category" do
    cat = Category.first
    assert_equal(1, cat.id)
    assert_not_equal(2, cat.id)
  end

  test "first category false" do
    cat = Category.first
    assert_not_equal(2, cat.id)
  end

  test "last category" do
    cat = Category.last
    assert_equal(9, cat.id)
  end

  test "last category false" do
    cat = Category.last
    assert_not_equal(2, cat.id)
  end

  test "count categories for 1st user" do
    cat = Category.all.where(user_id: 1)
    assert_equal(9, cat.length)
  end

  test "count categories for 1st user false" do
    cat = Category.all.where(user_id: 1)
    assert_not_equal(2, cat.length)
  end

end
