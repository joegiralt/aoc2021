defmodule Aoc2021.Day9.Solution do
  require IEx
  alias Aoc2021.Utils.Matrix, as: M

  defmodule Point do
    defstruct [:value, :position, :lowests, higher_neighbors: [], neighbors: []]
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
    two_dee_list = input()

    points =
      two_dee_list
      |> Enum.with_index()
      |> Enum.flat_map(fn {row, x} ->
        row
        |> Enum.with_index()
        |> Enum.map(fn {el, y} ->
          point_value = to_integer(el)

          neighbors = [{x - 1, y}, {x + 1, y}, {x, y - 1}, {x, y + 1}]
          neighbor_values = neighbors |> Enum.map(&value_at(&1, two_dee_list))

          higher_neighbors =
            Enum.zip(neighbor_values, neighbors)
            |> Enum.filter(fn {neighbor_value, _coord} ->
              neighbor_value > point_value
            end)
            |> Enum.map(fn {_neighbor_value, coord} -> coord end)

          {{x, y},
           %Point{
             value: point_value,
             position: {x, y},
             lowests: point_value == Enum.min([point_value | neighbor_values]),
             neighbors: neighbors,
             higher_neighbors: higher_neighbors
           }}
        end)
      end)

    points_graph =
      points
      |> Enum.reduce(%{}, fn {coord, point}, map ->
        Map.put(map, coord, point)
      end)

    lowest_points = Enum.filter(points, fn {_, point} -> point.lowests end)

    lowest_points
    |> Enum.map(fn {_, point} -> depth_search(point, points_graph, MapSet.new()) end)
    |> Enum.map(fn sets ->
      sets |> Enum.reduce(MapSet.new(), &MapSet.union(&1, &2))
    end)
    |> Enum.map(fn set ->
      set |> MapSet.to_list() |> length()
    end)
    |> Enum.sort(:desc)
    |> Enum.take(3)
    |> Enum.product()
  end

  def part(2, :over_a_second) do
    points =
      input()
      |> Enum.with_index()
      |> Enum.flat_map(fn {row, x} ->
        row
        |> Enum.with_index()
        |> Enum.map(fn {el, y} ->
          value = to_integer(el)

          {{x, y},
           %Point{
             value: value,
             position: {x, y},
             neighbors:
               [{x - 1, y}, {x + 1, y}, {x, y - 1}, {x, y + 1}]
               |> Enum.reject(fn {nx, ny} -> nx < 0 or ny < 0 end)
           }}
        end)
      end)

    points
    # |> (fn x -> IEx.pry() end).()
    |> Enum.reduce(%{}, fn {_pos, point}, acc ->
      # acc is a map of point => [point] where the key is the basin low point, and the value is a list of points leading to it

      if point in List.flatten(Map.values(acc)) or point.value == 9 do
        acc
      else
        {basin, followed_points} = follow(point, points)

        update_in(acc, [Access.key(basin, [])], &((&1 ++ followed_points) |> Enum.uniq()))
      end
    end)
    |> Enum.map(fn {_basin, followed} ->
      # plus one to include the basin
      Enum.count(followed) + 1
    end)
    |> Enum.sort(:desc)
    |> Enum.take(3)
    |> Enum.product()
  end

  defp to_integer(int) when is_integer(int), do: int
  defp to_integer(nil), do: nil
  defp to_integer({el, _idx}) when is_binary(el), do: String.to_integer(el)
  defp to_integer(el) when is_binary(el), do: String.to_integer(el)
  defp to_integer(%Point{value: value}), do: value

  def follow(point, all_points, followed_points \\ []) do
    min =
      point.neighbors
      |> Enum.map(&Map.get(all_points, &1))
      |> Enum.min_by(fn
        nil -> nil
        point -> point.value
      end)

    is_basin? = point.value < min.value

    if is_basin? do
      {point, followed_points}
    else
      follow(min, all_points, [point | followed_points])
    end
  end

  def local_min(%M{data: [[_, _, _], [_, nil, _], [_, _, _]], depth: _, width: _}), do: 0
  def local_min(%M{data: [[nil, nil, nil], [nil, nil, nil]], depth: _, width: _}), do: 0
  def local_min(%M{data: [[nil, nil], [nil, nil]], depth: _, width: _}), do: 0
  def local_min(%M{data: [[nil, nil], [nil, nil], [nil, nil]], depth: _, width: _}), do: 0

  def local_min(%M{data: point = [[_, _, _], [_, center, _], [_, _, _]], depth: 3, width: 3}) do
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

  def pad_with(twodee_list, pad_value) do
    row_length = twodee_list |> List.first() |> Enum.count()
    x = [List.duplicate(pad_value, row_length) | twodee_list] ++ [List.duplicate(nil, row_length)]
    [List.duplicate(pad_value, row_length) | x] ++ [List.duplicate(nil, row_length)]
  end

  def depth_search(%Point{higher_neighbors: []}, _, visited), do: [visited]
  def depth_search(nil, _, _), do: []

  def depth_search(point, points_graph, visited) do
    if(!MapSet.member?(visited, point.position)) do
      point.higher_neighbors
      |> Enum.flat_map(fn hn ->
        depth_search(points_graph[hn], points_graph, MapSet.put(visited, point.position))
      end)
    else
      []
    end
  end

  def value_at({x, y}, two_dee_list) do
    val_at_x = two_dee_list |> Enum.at(x)
    unless(val_at_x == nil, do: val_at_x |> Enum.at(y), else: 9)
  end
end
