require "test_helper"

class OperationTest < ActiveSupport::TestCase
  test "first  Operation" do
    operation =  Operation.first
    assert_equal(1, operation.id)
  end

  test "first  Operation false" do
    operation =  Operation.first
    assert_not_equal(12, operation.id)
  end

  test "last  Operation" do
    operation =  Operation.last
    assert_equal(57, operation.id)
  end

  test "last  Operation false" do
    operation =  Operation.last
    assert_not_equal(335, operation.id)
  end

  test "count operationegories for 1st user" do
    operation =  Operation.all.where(user_id: 1)
    assert_equal(57, operation.length)
  end

  test "count operationegories for 1st user false" do
    operation =  Operation.all.where(user_id: 1)
    assert_not_equal(45, operation.length)
  end
end
