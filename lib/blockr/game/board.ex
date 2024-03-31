defmodule Blockr.Game.Board do
  defstruct score: 0,
            tetro: nil,
            walls: [],
            points: MapSet.new([]),
            junkyard: []

  alias Blockr.Game.{Group, Tetromino}

  def new(opts \\ []) do
    __struct__(opts)
    |> new_tetro
    |> add_walls
  end

  def new_tetro(board) do
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

    %{board | walls: walls, points: MapSet.new(walls)}
  end

  defp count_complete_rows(board) do
    board.junkyard
    |> Map.new()
    |> Map.keys()
    |> Enum.group_by(fn {r, _c} -> r end)
    |> Map.values()
    |> Enum.count(fn list -> length(list) == 10 end)
  end

  def add_score(board) do
    number_of_rows = count_complete_rows(board)

    score =
      cond do
        number_of_rows == 0 ->
          0

        true ->
          :math.pow(2, number_of_rows)
          |> round()
          |> Kernel.*(50)
      end

    %{board | score: score}
  end

  def detach(board) do
    points = Tetromino.to_group(board.tetro)
    colors = Group.paint(points, board.tetro.name)

    mapset = Enum.reduce(points, board.points, &MapSet.put(&2, &1))

    %{board | points: mapset, junkyard: board.junkyard ++ colors}
    |> add_score()
  end

  def show(board) do
    tetro =
      board.tetro
      |> Tetromino.to_group()
      |> Group.paint(board.tetro.name)

    [tetro, board.walls, board.junkyard]
  end
end
