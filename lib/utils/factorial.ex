defmodule Aoc2021.Utils.Factorial do
  def of(0), do: 1

  def of(n) when n > 0 do
    Enum.reduce(1..n, &*/2)
  end
end
