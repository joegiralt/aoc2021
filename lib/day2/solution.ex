defmodule Aoc2021.Day2.Solution do
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
