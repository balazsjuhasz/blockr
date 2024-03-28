defmodule Blockr.Game.Board do
  defstruct score: 0,
            tetro: nil,
            walls: [],
            junkyard: []

  alias Blockr.Game.Tetromino

  def new(opts \\ []) do
    __struct__(opts)
    |> initialize_tetro
    |> add_walls
  end

  defp initialize_tetro(board) do
    random_name =
      [:s, :z, :l, :j, :i, :o, :t]
      |> Enum.random()

    %{board | tetro: Tetromino.new(name: random_name, location: {0, 3})}
  end

  defp add_walls(board) do
    walls =
      for row <- 0..21, col <- 0..11, row in [0, 21] or col in [0, 11] do
        {row, col}
      end

    %{board | walls: walls}
  end

  # walls:
  # donut (around the playing surface)
  # one square wide
  # {0, 0} -> {21, 11}
end
