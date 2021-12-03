defmodule Aoc2021.Day3.Solution do
  alias Aoc2021.Utils.Matrix, as: M
  require IEx

  def part(1) do
    input()
    |> M.new()
    |> M.transpose()
    |> M.unwrap()
    |> Enum.map(fn arr -> Enum.sort(arr) end)
    |> M.new()
    |> gamma_rate()
    |> mult_by_epsilon_rate()
  end

  def part(2) do
  end

  def gamma_rate(%M{data: data, depth: _depth, width: width}) do
    gamma_idx = Kernel.trunc(width / 2)
    epsilon_idx = gamma_idx + 1

    data
    |> Enum.map(fn row ->
      Enum.slice(row, Range.new(gamma_idx, epsilon_idx))
    end)
    |> M.new()
    |> M.transpose()
    |> M.unwrap()
    |> List.first()
  end

  def mult_by_epsilon_rate(gamma_rate) do
    g =
      gamma_rate
      |> Enum.join("")
      |> String.to_integer(2)

    e =
      gamma_rate
      |> bitflip()
      |> Enum.join("")
      |> String.to_integer(2)

    g * e
  end

  def bitflip(arr) do
    arr
    |> Enum.map(&flip(&1))
  end

  def flip("0"), do: "1"
  def flip("1"), do: "0"

  def input do
    File.read!("lib/day3/input.txt")
    |> Advent2021.Parser.parse_list(& &1)
    |> Enum.map(&String.codepoints/1)
  end
end
