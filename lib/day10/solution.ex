defmodule Aoc2021.Day10.Solution do
  require IEx

  @match %{"{" => "}", "[" => "]", "(" => ")", "<" => ">"}
  @value %{")" => 3, "]" => 57, "}" => 1197, ">" => 25137}
  @incomplete_value %{")" => 1, "]" => 2, "}" => 3, ">" => 4}

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
    |> Enum.map(&find_incomplete(&1, []))
    |> Enum.filter(&(&1 != nil))
    |> Enum.map(&Enum.reduce(&1, 0, fn x, v -> v * 5 + @incomplete_value[x] end))
    |> Enum.sort()
    |> then(&Enum.at(&1, div(length(&1), 2)))
  end

  def find_error([], _), do: nil
  def find_error([x | xstack], [y | ystack]) when x == y, do: find_error(xstack, ystack)

  def find_error([x | xstack], ystack) do
    if Map.has_key?(@match, x) do
      find_error(xstack, [@match[x] | ystack])
    else
      x
    end
  end

  def find_incomplete([], ystack), do: ystack
  def find_incomplete([x | xstack], [y | ystack]) when x == y, do: find_incomplete(xstack, ystack)

  def find_incomplete([x | xstack], ystack),
    do: if(Map.has_key?(@match, x), do: find_incomplete(xstack, [@match[x] | ystack]), else: nil)

  def score(x), do: @value[x]

  def input do
    File.read!("lib/day10/input.txt")
    |> String.split("\n", trim: true)
    |> Enum.map(&String.codepoints/1)
  end
end
