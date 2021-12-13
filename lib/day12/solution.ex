defmodule Aoc2021.Day12.Solution do
  require IEx

  def part(1) do
    paths("start", ["start"], input(), MapSet.new(["start"]), :part_1)
    |> Enum.count()
  end

  def part(2) do
    paths("start", ["start"], input(), MapSet.new(), MapSet.new(), :part_2)
    |> Enum.count()
  end

  def paths(current_vertex, path, graph, seen, :part_1) do
    Graph.neighbors(graph, current_vertex)
    |> Enum.reject(fn vert ->
      MapSet.member?(seen, vert)
    end)
    |> Enum.flat_map(fn
      "end" ->
        [["end" | path]]

      vertex ->
        paths(vertex, [vertex | path], graph, handle_small_caves(seen, vertex), :part_1)
    end)
  end

  def paths(current_vertex, path, graph, seen_once, seen_twice, :part_2) do
    # IO.inspect([current_vertex, path, seen_once, seen_twice], label: :bullshit)

    Graph.neighbors(graph, current_vertex)
    |> Enum.filter(fn item->
      MapSet.size(seen_twice) == 0 or (!MapSet.member?(seen_once, item) && !MapSet.member?(seen_twice, item))
    end)
    |> Enum.flat_map(fn
      "start" ->
        []

      "end" ->
        [["end" | path]]

      current_vertex ->
        is_lower = lower?(current_vertex)
        has_seen_once = MapSet.member?(seen_once, current_vertex)
        has_seen_twice = MapSet.member?(seen_twice, current_vertex) and has_seen_once
        cond do
          is_lower and has_seen_twice ->
            paths(current_vertex, [current_vertex | path], graph, seen_once, seen_twice, :part_2)

          is_lower and has_seen_once ->
            paths(
              current_vertex,
              [current_vertex | path],
              graph,
              seen_once,
              MapSet.put(seen_twice, current_vertex),
              :part_2
            )

          is_lower ->
            paths(
              current_vertex,
              [current_vertex | path],
              graph,
              MapSet.put(seen_once, current_vertex),
              seen_twice,
              :part_2
            )

          true ->
            # IEx.pry()

            paths(current_vertex, [current_vertex | path], graph, seen_once, seen_twice, :part_2)
        end
    end)
  end

  def handle_small_caves(seen, vertex) do
    if(vertex |> lower?(), do: MapSet.put(seen, vertex), else: seen)
  end

  def lower?(s), do: s == String.downcase(s, :ascii)

  def pretty_print(g) do
    {:ok, str} = Graph.to_dot(g)
    IO.puts(str)
  end

  def input do
    input =
      File.read!("lib/day12/input.txt")
      |> String.split("\n", trim: true)
      |> Enum.map(&String.split(&1, "-", trim: true))

    lines = input

    g_with_vertices =
      lines
      |> List.flatten()
      |> Enum.uniq()
      |> Enum.reduce(Graph.new(type: :undirected), fn vertex, graph ->
        graph |> Graph.add_vertex(vertex, vertex)
      end)

    lines
    |> Enum.reduce(g_with_vertices, fn [a, b] = _, graph ->
      graph |> Graph.add_edges([{a, b}])
    end)
  end
end
