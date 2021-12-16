defmodule Aoc2021.Day12.Solution do
  require IEx

  def part(1) do
    paths(:start, [:start], input(), MapSet.new([:start]), :part_1)
    |> Enum.count()
  end

  def part(2) do
    paths(:start, [:start], input(), MapSet.new(), MapSet.new(), :part_2)
    |> Enum.count()
  end

  defp paths(current_cave, path, graph, seen, :part_1) do
    Graph.neighbors(graph, current_cave)
    |> Enum.reject(fn cave -> cave in seen end)
    |> Enum.flat_map(fn
      :end ->
        [[:end | path]]

      cave ->
        paths(cave, [cave | path], graph, handle_small_caves(seen, cave), :part_1)
    end)
  end

  defp paths(current_cave, path, graph, seen_once, seen_twice, :part_2) do
    Graph.neighbors(graph, current_cave)
    |> Enum.filter(fn cave ->
      MapSet.size(seen_twice) == 0 or
        (!MapSet.member?(seen_once, cave) && !MapSet.member?(seen_twice, cave))
    end)
    |> Enum.flat_map(fn
      :start ->
        []

      :end ->
        [[:end | path]]

      current_cave ->
        smaller_cave? = small_cave?(current_cave)
        seen_once? = MapSet.member?(seen_once, current_cave)
        seen_twice? = MapSet.member?(seen_twice, current_cave) and seen_once?

        cond do
          smaller_cave? and seen_twice? ->
            paths(current_cave, [current_cave | path], graph, seen_once, seen_twice, :part_2)

          smaller_cave? and seen_once? ->
            paths(
              current_cave,
              [current_cave | path],
              graph,
              seen_once,
              MapSet.put(seen_twice, current_cave),
              :part_2
            )

          smaller_cave? ->
            paths(
              current_cave,
              [current_cave | path],
              graph,
              MapSet.put(seen_once, current_cave),
              seen_twice,
              :part_2
            )

          true ->
            paths(current_cave, [current_cave | path], graph, seen_once, seen_twice, :part_2)
        end
    end)
  end

  defp handle_small_caves(seen, cave) do
    if(cave |> small_cave?(), do: MapSet.put(seen, cave), else: seen)
  end

  defp small_cave?(cave) when is_atom(cave) do
    true
  end

  defp small_cave?(_), do: false

  defp input do
    input =
      File.read!("lib/day12/input.txt")
      |> String.split("\n", trim: true)
      |> Enum.map(&String.split(&1, "-", trim: true))
      |> Enum.map(fn pair ->
        pair
        |> Enum.map(fn cave ->
          if cave == String.downcase(cave, :ascii) do
            cave |> String.to_atom()
          else
            cave
          end
        end)
      end)

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
