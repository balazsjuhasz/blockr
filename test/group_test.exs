defmodule GroupTest do
  use ExUnit.Case

  @test_shape [{2, 3}, {2, 4}, {3, 3}, {4, 3}]

  test "Move group down" do
    assert Group.move_down(@test_shape) == [{3, 3}, {3, 4}, {4, 3}, {5, 3}]
  end

  test "Move group left" do
    assert Group.move_left(@test_shape) == [{2, 2}, {2, 3}, {3, 2}, {4, 2}]
  end

  test "Move group right" do
    assert Group.move_right(@test_shape) == [{2, 4}, {2, 5}, {3, 4}, {4, 4}]
  end

  test "Swap group" do
    assert Group.swap(@test_shape) == [{3, 2}, {4, 2}, {3, 3}, {3, 4}]
  end

  test "Flip left and right" do
    assert Group.flip_left_right(@test_shape) == [{2, 2}, {2, 1}, {3, 2}, {4, 2}]
  end

  test "Flip top and bottom" do
    assert Group.flip_top_bottom(@test_shape) == [{3, 3}, {3, 4}, {2, 3}, {1, 3}]
  end

  test "Rotate 90" do
    assert Group.rotate(@test_shape, 90) == [{3, 3}, {4, 3}, {3, 2}, {3, 1}]
  end

  test "Rotate 180" do
    assert Group.rotate(@test_shape, 180) == [{3, 2}, {3, 1}, {2, 2}, {1, 2}]
  end

  test "Rotate 270" do
    assert Group.rotate(@test_shape, 270) == [{2, 2}, {1, 2}, {2, 3}, {2, 4}]
  end
end
