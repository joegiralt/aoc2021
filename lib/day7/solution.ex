defmodule Aoc2021.Day7.Solution do
  require IEx
  alias Aoc2021.Utils.TriangleNumber

  def part(1) do
    data = input()

    data
    |> Enum.map(fn key ->
      data
      |> Enum.map(fn position ->
        {min, max} = Enum.min_max([position, key])
        max - min
      end)
      |> Enum.sum()
    end)
    |> Enum.sort()
    |> List.first()
  end

  def part(2) do
    data = input()

    data
    |> Enum.reduce(%{}, fn key, map ->
      Map.update(map, key, data, & &1)
    end)
    |> Enum.map(fn {key, crab_positions} ->
      {
        crab_positions
        |> Enum.map(fn position ->
          {min, max} = Enum.min_max([key, position])
          TriangleNumber.of(max - min)
        end)
        |> Enum.sum(),
        key
      }
    end)
    |> Enum.into(%{})
    |> Enum.sort()
    |> List.first()
    |> elem(0)
  end

  def input do
    File.read!("lib/day7/input.txt")
    |> Advent2021.Parser.parse_list(&String.split(&1, ","))
    |> List.first()
    |> Enum.map(&String.to_integer(&1))
  end
end
