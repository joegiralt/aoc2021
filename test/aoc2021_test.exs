defmodule Aoc2021Test do
  use ExUnit.Case
  alias Aoc2021.Utils.Matrix
  alias Aoc2021.Utils.Geometry, as: Geo
  alias Aoc2021.Utils.Line
  doctest Aoc2021

  test "greets the world" do
    assert Aoc2021.hello() == :world
  end

  test "Matrix transpose" do
    m = [[1, 1, 1, 1], [2, 4, 8, 16], [3, 9, 27, 81], [4, 16, 64, 256], [5, 25, 125, 625]]
    output = [[1, 2, 3, 4, 5], [1, 4, 9, 16, 25], [1, 8, 27, 64, 125], [1, 16, 81, 256, 625]]
    result = Matrix.new(m) |> Matrix.transpose()

    assert result.data == output
  end

  test "line coords 1" do
    result = [1, 1, 1, 3] |> Line.new()
    assert result.point_coords == [{1, 1}, {1, 2}, {1, 3}]
  end

  test "line coords 2" do
    result = [2, 2, 2, 1] |> Line.new()
    assert result.point_coords == [{2, 2}, {2, 1}]
  end

  test "line coords 3" do
    result = [8, 0, 0, 8] |> Line.new()

    assert result.point_coords == [
             {8, 0},
             {7, 1},
             {6, 2},
             {5, 3},
             {4, 4},
             {3, 5},
             {2, 6},
             {1, 7},
             {0, 8}
           ]
  end

  test "line coords 4" do
  end
end
