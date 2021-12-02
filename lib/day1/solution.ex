defmodule Aoc2021.Day1.Solution do
  def part(1) do
    input()
    |> Enum.chunk_every(2, 1)
    |> Enum.filter(&is_sorted/1)
    |> Enum.count()
  end

  def part(2) do
    input()
    |> Enum.chunk_every(3, 1)
    |> Enum.map(&Enum.sum/1)
    |> Enum.chunk_every(2, 1)
    |> Enum.filter(&is_sorted/1)
    |> Enum.count()
  end

  def is_sorted(item) do
    List.first(item) < List.last(item)
  end

  def input do
    File.read!("lib/day1/input.txt")
    |> Advent2021.Parser.parse_list(&String.to_integer/1)
  end
end
