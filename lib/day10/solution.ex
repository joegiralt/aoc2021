defmodule Aoc2021.Day10.Solution do
  require IEx

  @match %{"{" => "}", "[" => "]", "(" => ")", "<" => ">"}
  @value %{")" => 3, "]" => 57, "}" => 1197, ">" => 25137}

  def part(1) do
    input()
    |> Enum.map(&find_error(&1, []))
    |> Enum.map(fn x -> x end)
    |> Enum.filter(&(&1 != nil))
    |> Enum.map(&score(&1))
    |> Enum.sum()
  end

  def part(2) do
    input()
  end

  def find_error([], _), do: nil
  def find_error([x | xs], [y | ys]) when x == y, do: find_error(xs, ys)

  def find_error([x | xs], ys) do
    if Map.has_key?(@match, x) do
      find_error(xs, [@match[x] | ys])
    else
      x
    end
  end

  def score(x), do: @value[x]

  def input do
    File.read!("lib/day10/input.txt")
    |> String.split("\n", trim: true)
    |> Enum.map(&String.codepoints/1)
  end
end
