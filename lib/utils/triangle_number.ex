defmodule Aoc2021.Utils.TriangleNumber do
  def of(0), do: 0

  def of(n) when n > 0 do
    n * (n + 1) / 2
  end
end
