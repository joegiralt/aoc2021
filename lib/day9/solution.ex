defmodule Aoc2021.Day9.Solution do
  require IEx
  alias Aoc2021.Utils.Matrix, as: M

  defmodule Point do
    defstruct [:value, :position, :lowests, neighbors: []]
  end

  def part(1) do
    input()
    |> then(&pad_with(&1, nil))
    |> M.new()
    |> M.transpose()
    |> M.unwrap()
    |> then(&pad_with(&1, nil))
    |> Enum.chunk_every(3, 1)
    |> Flow.from_enumerable(max_demand: 5, stages: 10)
    |> Flow.partition(max_demand: 5)
    |> Flow.flat_map(fn by_three ->
      by_three
      |> M.new()
      |> M.transpose()
      |> M.unwrap()
      |> Enum.chunk_every(3, 1)
      |> Enum.map(&M.new(&1))
    end)
    |> Flow.map(fn point -> local_min(point) end)
    |> Enum.to_list()
    |> Enum.sum()
  end

  def part(2, :graph) do
    matrix = M.new(input()) |> M.transpose()

    points =
      for x <- Range.new(0, matrix.depth) do
        for y <- Range.new(0, matrix.width) do
          point_value = value_at({x, y}, matrix.data)

          neighbors =
            [{x - 1, y}, {x + 1, y}, {x, y - 1}, {x, y + 1}]
            |> Enum.reject(fn {nx, ny} -> nx < 0 or ny < 0 end)

          neighbor_values = neighbors |> Enum.map(&value_at(&1, matrix.data))

          higher_neighbors =
            Enum.zip(neighbor_values, neighbors)
            |> Enum.filter(fn {neighbor_value, _coord} ->
              if point_value == nil || neighbor_value == nil do
                []
              else
                to_integer(neighbor_value) >= to_integer(point_value)
              end
            end)
            |> List.flatten()
            |> Enum.map(fn {_neighbor_value, coord} -> coord end)

          Enum.min([point_value | neighbor_values])

          {{x, y},
           %Point{
             value: point_value,
             position: {x, y},
             lowests: point_value == Enum.min([point_value | neighbor_values]),
             neighbors: higher_neighbors
           }}
        end
      end
      |> List.flatten()
      |> Enum.filter(fn {_, point} -> point.value != nil end)

    points_graph =
      Enum.reduce(points, %{}, fn {coord, point}, map ->
        Map.put(map, coord, point)
      end)

    {:ok, points_graph_agent} = Agent.start_link(fn -> points_graph end)

    points
    |> Enum.filter(fn {_, point} -> point.lowests end)
    |> Flow.from_enumerable(max_demand: 1, stages: 1)
    |> Flow.partition(max_demand: 1)
    |> Enum.map(fn {_, point} -> depth_search(point, points_graph_agent, MapSet.new()) end)
    |> Enum.map(fn sets -> sets |> Enum.reduce(MapSet.new(), &MapSet.union(&1, &2)) end)
    |> Enum.map(fn set -> set |> MapSet.to_list() end)
    |> Enum.map(&Enum.count(&1))
    |> Enum.to_list()
    |> Enum.sort(:desc)
    |> Enum.take(3)
    |> Enum.product()
  end

  defp to_integer(int) when is_integer(int), do: int
  defp to_integer(x), do: IEx.pry()

  defp depth_search(%Point{value: 9}, _, visited), do: [visited]
  defp depth_search(%Point{value: nil}, _, _), do: []
  defp depth_search(nil, _, _), do: []

  defp depth_search(point, points_graph_agent, visited) do
    been_here = MapSet.member?(visited, point.position)

    if been_here do
      [visited]
    else
      point.neighbors
      |> Enum.flat_map(fn nieghbor_coordinate ->
        MapSet.put(visited, point.position)

        depth_search(
          Agent.get(points_graph_agent, fn points_graph -> points_graph[nieghbor_coordinate] end),
          points_graph_agent,
          MapSet.put(visited, point.position)
        )
      end)
    end
  end

  defp local_min(%M{data: [[_, _, _], [_, nil, _], [_, _, _]], depth: _, width: _}), do: 0
  defp local_min(%M{data: [[nil, nil, nil], [nil, nil, nil]], depth: _, width: _}), do: 0
  defp local_min(%M{data: [[nil, nil], [nil, nil]], depth: _, width: _}), do: 0
  defp local_min(%M{data: [[nil, nil], [nil, nil], [nil, nil]], depth: _, width: _}), do: 0

  defp local_min(%M{data: point = [[_, _, _], [_, center, _], [_, _, _]], depth: 3, width: 3}) do
    if(center == point |> List.flatten() |> Enum.min()) do
      center + 1
    else
      0
    end
  end

  def input do
    File.read!("lib/day9/input.txt")
    |> Advent2021.Parser.parse_list(&String.split(&1, "", trim: true))
    |> Enum.map(fn list -> list |> Enum.map(&String.to_integer(&1)) end)
  end

  defp pad_with(twodee_list, pad_value) do
    row_length = twodee_list |> List.first() |> Enum.count()

    x =
      [List.duplicate(pad_value, row_length) | twodee_list] ++
        [List.duplicate(pad_value, row_length)]

    [List.duplicate(pad_value, row_length) | x] ++ [List.duplicate(pad_value, row_length)]
  end

  def border_with(twodee_list) do
    row_length = twodee_list |> List.first() |> Enum.count()

    [List.duplicate(0, row_length) | twodee_list] ++
      [List.duplicate(0, row_length)]
  end

  defp value_at({x, y}, two_dee_list) do
    val_at_x = two_dee_list |> Enum.at(x)
    unless(val_at_x == nil, do: val_at_x |> Enum.at(y), else: 9)
  end
end
