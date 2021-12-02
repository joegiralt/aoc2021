defmodule Aoc2021.Day2.Solution do
  def input do
    File.read!("lib/day2/input.txt")
    |> Advent2021.Parser.parse_list(&Function.identity/1)
  end
end
