defmodule Aoc2021Test do
  use ExUnit.Case
  alias Aoc2021.Utils.Matrix
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
end
