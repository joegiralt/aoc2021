defmodule Aoc2021.Day3.Solution do
  alias Aoc2021.Utils.Matrix, as: M
  require IEx

  def part(1) do
    input()
    |> M.transpose()
    |> M.unwrap()
    |> Enum.map(fn arr -> Enum.sort(arr) end)
    |> M.new()
    |> gamma_rate()
    |> mult_by_epsilon_rate()
  end

  def part(2) do
    bit_list =
      input()
      |> M.unwrap()

    search(bit_list, 0, &oxygen(&1)) * search(bit_list, 0, &carbon_dioxide(&1))
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

  def search(bit_list, _, _) when length(bit_list) == 1 do
    bit_list
    |> List.first()
    |> Enum.join()
    |> String.to_integer(2)
  end

  def search(bit_list, depth, bit_criteria_fn) do
    bit =
      bit_list
      |> M.new()
      |> M.transpose()
      |> M.unwrap()
      |> Enum.at(depth)
      |> Enum.frequencies()
      |> Map.update("1", 0, &(&1 + 0))
      |> Map.update("0", 0, &(&1 + 0))
      |> bit_criteria_fn.()

    bit_list
    |> Enum.filter(fn bit_list -> Enum.at(bit_list, depth) == bit end)
    |> search(depth + 1, bit_criteria_fn)
  end

  def oxygen(%{"0" => zero_count, "1" => one_count}) do
    if one_count >= zero_count do
      "1"
    else
      "0"
    end
  end

  def carbon_dioxide(%{"0" => zero_count, "1" => one_count}) do
    if one_count < zero_count do
      "1"
    else
      "0"
    end
  end

  def input do
    File.read!("lib/day3/input.txt")
    |> Advent2021.Parser.parse_list(& &1)
    |> Enum.map(&String.codepoints/1)
    |> M.new()
  end
end
