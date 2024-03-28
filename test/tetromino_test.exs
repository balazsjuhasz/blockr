defmodule TetrominoTest do
  use ExUnit.Case

  test "Create new Tetromino" do
    assert Tetromino.new() == %Tetromino{name: :i, location: {0, 0}, rotation: 0, color: :green}
  end

  test "Left" do
    assert Tetromino.new() |> Tetromino.left() == %Tetromino{
             name: :i,
             location: {0, -1},
             rotation: 0,
             color: :green
           }
  end

  test "Right" do
    assert Tetromino.new() |> Tetromino.right() == %Tetromino{
             name: :i,
             location: {0, 1},
             rotation: 0,
             color: :green
           }
  end

  test "Fall" do
    assert Tetromino.new() |> Tetromino.fall() == %Tetromino{
             name: :i,
             location: {1, 0},
             rotation: 0,
             color: :green
           }
  end

  test "Rotate right 90" do
    assert Tetromino.new() |> Tetromino.rotate_right_90() == %Tetromino{
             name: :i,
             location: {0, 0},
             rotation: 90,
             color: :green
           }
  end

  test "Rotate right 180" do
    assert Tetromino.new() |> Tetromino.rotate_right_90() |> Tetromino.rotate_right_90() ==
             %Tetromino{
               name: :i,
               location: {0, 0},
               rotation: 180,
               color: :green
             }
  end

  test "Rotate right 270" do
    assert Tetromino.new()
           |> Tetromino.rotate_right_90()
           |> Tetromino.rotate_right_90()
           |> Tetromino.rotate_right_90() ==
             %Tetromino{
               name: :i,
               location: {0, 0},
               rotation: 270,
               color: :green
             }
  end

  test "Rotate right 360" do
    assert Tetromino.new()
           |> Tetromino.rotate_right_90()
           |> Tetromino.rotate_right_90()
           |> Tetromino.rotate_right_90()
           |> Tetromino.rotate_right_90() ==
             %Tetromino{
               name: :i,
               location: {0, 0},
               rotation: 0,
               color: :green
             }
  end
end
