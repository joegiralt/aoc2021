defmodule Aoc2021.Utils.TriangleNumber do
  alias Aoc2021.Utils.Memoize

  def of(0), do: 0

  def of(n) when n > 0 do
    # Memoize.run(:of, fn ->
      n * (n + 1) / 2
    # end)
  end
end
