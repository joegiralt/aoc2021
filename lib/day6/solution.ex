defmodule Aoc2021.Day6.Solution do
  def part(1) do
    simulate({0, input()})
  end

  def part(2) do
    input()
    |> Enum.frequencies()
    |> cycle(256)
    |> Map.values()
    |> Enum.sum()
  end

  def cycle(fish, 0), do: fish

  def cycle(fish, n) do
    zero_count = Map.get(fish, 0, 0)

    fish
    |> Enum.filter(fn {n, _} -> n > 0 end)
    |> Enum.map(fn {n, k} -> {n - 1, k} end)
    |> Map.new()
    |> Map.update(6, zero_count, &(&1 + zero_count))
    |> Map.put(8, zero_count)
    |> cycle(n - 1)
  end

  def simulate({80, life_cycles}) do
    life_cycles |> Enum.count()
  end

  def simulate({day, life_cycles}) do
    simulate({day + 1, life_cycles |> Enum.flat_map(&next_cycle(&1))})
  end

  def next_cycle(8), do: [7]
  def next_cycle(7), do: [6]
  def next_cycle(6), do: [5]
  def next_cycle(5), do: [4]
  def next_cycle(4), do: [3]
  def next_cycle(3), do: [2]
  def next_cycle(2), do: [1]
  def next_cycle(1), do: [0]
  def next_cycle(0), do: [6, 8]

  def input() do
    File.read!("lib/day6/input.txt")
    |> Advent2021.Parser.parse_list(&String.split(&1, ","))
    |> List.first()
    |> Enum.map(&String.to_integer(&1))
  end
end
