defmodule Aoc2021.Day2.Solution do
  require IEx
  import Nx.Defn

  def part(1) do
    %{"down" => down, "forward" => forward, "up" => up} = traversals()
    (down - up) * forward
  end

  def part(2) do
    %{"depth" => depth, "forward" => forward} =
      input()
      |> Enum.reduce(%{}, &dir_update/2)

    depth * forward
  end

  def part(1, :nx) do
    File.read!("lib/day2/input.txt")
    |> String.split("\n")
    |> Enum.map(fn line ->
      [direction, amt] = String.split(line)
      amt_int = String.to_integer(amt)

      case direction do
        "forward" -> {amt_int, 0}
        "up" -> {0, -amt_int}
        "down" -> {0, amt_int}
      end
    end)
    |> Enum.unzip()
    |> then(fn {xs, ys} ->
      Nx.multiply(
        Nx.sum(Nx.tensor(xs)),
        Nx.sum(Nx.tensor(ys))
      )
    end)
  end

  def part(1, :defn) do
    File.read!("lib/day2/input.txt")
    |> String.split("\n", trim: true)
    |> Enum.map(fn
      "forward " <> number -> [0, String.to_integer(number)]
      "up " <> number -> [1, String.to_integer(number)]
      "down " <> number -> [2, String.to_integer(number)]
    end)
    |> Nx.tensor()
    |> navigate()
  end

  defn navigate(tensor) do
    {size, _} = Nx.shape(tensor)

    {_, depth, position, _} =
      while {i = 0, depth = 0, position = 0, tensor}, i < size do
        instruction = tensor[i][0]
        value = tensor[i][1]

        cond do
          instruction == 0 -> {i + 1, depth, position + value, tensor}
          instruction == 1 -> {i + 1, depth + value, position, tensor}
          instruction == 2 -> {i + 1, depth - value, position, tensor}
          :other_wise -> {i + 1, depth, position, tensor}
        end
      end

    depth * position
  end

  def traversals do
    input()
    |> Enum.reduce(%{}, fn direction, map ->
      [command, int_val] = direction
      Map.update(map, command, int_val, &(&1 + int_val))
    end)
  end

  def dir_update(["up", value], map) do
    Map.update(map, "up", value, &(&1 + value))
  end

  def dir_update(["down", value], map) do
    Map.update(map, "down", value, &(&1 + value))
  end

  def dir_update(["forward", value], map) do
    new_map = Map.update(map, "forward", value, &(&1 + value))

    Map.update(new_map, "depth", aim(new_map), &(&1 + aim(new_map) * value))
  end

  def aim(map) do
    (map["down"] || 0) - (map["up"] || 0)
  end

  def input do
    File.read!("lib/day2/input.txt")
    |> Advent2021.Parser.parse_list(&String.split/1)
    |> Enum.map(fn [command, val] = _item ->
      {int_val, ""} = Integer.parse(val)
      [command, int_val]
    end)
  end
end
