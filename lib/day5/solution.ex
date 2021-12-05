defmodule Aoc2021.Day5.Solution do
  alias Aoc2021.Utils.Line
  require IEx

  def part(1) do
    input()
    |> Enum.filter(fn line ->
      elem(line.start, 0) == elem(line.end, 0) || elem(line.start, 1) == elem(line.end, 1)
    end)
    |> Enum.flat_map(fn line -> line.point_coords end)
    |> Enum.reduce(%{}, fn point, map -> Map.update(map, point, 0, &(&1 + 1)) end)
    |> Map.values()
    |> Enum.filter(fn num -> num != 0 end)
    |> Enum.count()
  end

  def part(2) do
    input()
    |> Enum.flat_map(fn line -> line.point_coords end)
    |> Enum.reduce(%{}, fn point, map -> Map.update(map, point, 0, &(&1 + 1)) end)
    |> Map.values()
    |> Enum.filter(fn num -> num != 0 end)
    |> Enum.count()
  end

  def input do
    File.read!("lib/day5/input.txt")
    |> Advent2021.Parser.parse_list(&String.split(&1, " -> "))
    |> Flow.from_enumerable(max_demand: 1, stages: 1)
    |> Flow.partition(max_demand: 5)
    |> Flow.map(fn x ->
      x
      |> Enum.map(&String.split(&1, ","))
      |> List.flatten()
      |> Enum.map(&String.to_integer(&1))
      |> Line.new()
    end)
    |> Enum.to_list()
  end
end
