defmodule Blockr.Game do
  alias Blockr.Game.{Board, Tetromino}

  def left(board) do
    tetro = Tetromino.left(board.tetro)
    replace_until_collides(board, tetro)
  end

  def right(board) do
    tetro = Tetromino.right(board.tetro)
    replace_until_collides(board, tetro)
  end

  def turn(board) do
    tetro = Tetromino.rotate_right_90(board.tetro)
    replace_until_collides(board, tetro)
  end

  def fall(board) do
    tetro = Tetromino.fall(board.tetro)

    if collides?(board, tetro) do
      crash(board)
    else
      %{board | tetro: tetro}
    end
  end

  def crash(board) do
    board
    |> Board.detach()
    |> Board.new_tetro()
  end

  defp replace_until_collides(board, tetro) do
    unless collides?(board, tetro) do
      %{board | tetro: tetro}
    else
      board
    end
  end

  defp collides?(board, tetro) do
    set =
      tetro
      |> Tetromino.to_group()
      |> MapSet.new()

    intersection = MapSet.intersection(set, board.points)

    MapSet.size(intersection) > 0
  end
end
