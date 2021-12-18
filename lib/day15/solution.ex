defmodule Aoc2021.Day15.Solution do
  require IEx

  def part(1, {row, col}) do
    [graph, lookup] =
      input()
      |> grid_from_lines()
      |> map_vertices()

    map_edges(graph, lookup)
    |> Graph.get_shortest_path({0, 0}, {row - 1, col - 1})
    |> Enum.map(fn x ->
      lookup[x]
    end)
    |> Enum.drop(1)
    |> Enum.sum()
  end

  def part(2, {row, col}) do
    [graph, lookup] =
      input()
      |> grid_from_lines()
      |> expand({row, col})
      |> map_vertices()

    graph
    |> map_edges(lookup)
    |> IO.inspect()
    |> Graph.get_shortest_path({0, 0}, {5 * row - 1, 5 * col - 1})
    |> Enum.drop(1)
    |> Enum.map(fn pos ->
      Map.get(lookup, pos)
    end)
    |> Enum.sum()
  end

  def map_vertices(lookup) do
    # graph = Graph.new
    graph =
      lookup
      |> Map.keys()
      |> Enum.reduce(Graph.new(), fn vertex, graph ->
        graph |> Graph.add_vertex(vertex, vertex)
      end)

    [graph, lookup]
  end

  def print(map) do
    IO.puts("")

    height = Map.keys(map) |> Enum.map(fn {x, _} -> x end) |> Enum.max()
    width = Map.keys(map) |> Enum.map(fn {_, y} -> y end) |> Enum.max()

    Enum.map(0..width, fn row ->
      Enum.map(0..height, fn col ->
        pos = {col, row}
        value = Map.get(map, pos, ".")
        to_string(value)
      end)
      |> Enum.intersperse("")
    end)
    |> Enum.join("\n")
    |> IO.puts()

    map
  end

  def map_edges(graph, lookup) do
    graph =
      lookup
      |> Enum.reduce(graph, fn {pos, val}, acc ->
        pos
        |> neighbors(lookup)
        |> Enum.reduce(acc, fn des, acc ->
          tw = Map.get(lookup, des, 10)
          Graph.add_edge(acc, pos, des, weight: val + tw)
        end)
      end)

    fail =
      graph
      |> Graph.edges()
      |> Enum.filter(fn %Graph.Edge{v1: {x1, y1}, v2: {x2, y2}} ->
        abs(x1 - x2) > 1 and abs(y1 - y2) > 1
      end)

    graph
    |> Graph.delete_edges(fail)
  end

  def manhattan_distance({x1, y1} = _a, {x2, y2} = _b) do
    abs(x1 - x2) > 1 + abs(y1 - y2)
  end

  def neighbors({x, y} = _pos, lookup) do
    neighbors = [{x - 1, y}, {x + 1, y}, {x, y - 1}, {x, y + 1}]
    neighbors |> Enum.filter(&lookup[&1])
  end

  def input do
    File.read!("lib/day15/input.txt")
    |> Advent2021.Parser.parse_list(&Function.identity(&1))
  end

  def grid_from_lines(lines) do
    for {line, row} <- Enum.with_index(lines),
        {number, col} <- Enum.with_index(String.to_charlist(line)),
        into: %{} do
      {{row, col}, number - ?0}
    end
  end

  def calc_weight(_current, nieghbor, _lookup) do
    manhattan_distance(nieghbor, {99, 99})
  end

  def expand(risk_map, _n) do
    {max_x, max_y} = risk_map |> Map.keys() |> Enum.max()

    for {{x, y}, risk} <- risk_map, tile_y <- 0..4, tile_x <- 0..4 do
      x = tile_x * (max_x + 1) + x
      y = tile_y * (max_y + 1) + y
      risk = rem(risk + tile_x + tile_y - 1, 9) + 1
      {{x, y}, risk}
    end
    |> Map.new()
  end
end
