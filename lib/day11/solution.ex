defmodule Aoc2021.Day11.Solution do
  require IEx

  # alias Aoc2021.Utils.Matrix, as: M

  def part(1) do
    input()
    |> grid_from_lines()
    |> start_flashing(100, [])
    |> Enum.map(&MapSet.size(&1))
    |> Enum.sum()
  end

  def part(2) do
    input()
    |> grid_from_lines()
    |> find_iteration_for_uniflash(0, 0)
  end

  def grid_from_lines(lines) do
    for {line, row} <- Enum.with_index(lines),
        {number, col} <- Enum.with_index(String.to_charlist(line)),
        into: %{} do
      {{row, col}, number - ?0}
    end
  end

  def find_iteration_for_uniflash(grid, iteration, count) when is_map(grid) do
    if count == 1 do
      iteration
    else
      [_, reduced_grid] =
        grid
        |> Map.new(fn {point, v} -> {point, v + 1} end)
        |> reduce_to_flash()

      count =
        reduced_grid
        |> Map.values()
        |> Enum.uniq()
        |> Enum.count()

      find_iteration_for_uniflash(reduced_grid, iteration + 1, count)
    end
  end

  def start_flashing(_, 0, flashes), do: flashes

  def start_flashing(grid, iteration, flashes) do
    # IO.inspect(M.list_matrix_from_grid(grid, 10, 10) |> M.unwrap(), label: iteration)
    [flash_points_set, reduced_grid] =
      grid
      |> Map.new(fn {point, v} -> {point, v + 1} end)
      |> reduce_to_flash()

    start_flashing(reduced_grid, iteration - 1, [flash_points_set | flashes])
  end

  def reduce_to_flash(grid) do
    grid
    |> Enum.reduce([MapSet.new(), grid], fn {point, _}, [acc_set, acc_grid] = _acc ->
      {new_flashes, flashed_grid} = flash({acc_set, acc_grid}, point)
      [MapSet.union(acc_set, new_flashes), flashed_grid]
    end)
  end

  def flash({set, grid} = _tup, {row, col} = point) when row in 0..9 and col in 0..9 do
    if grid[point] in [10] and grid[point] not in [nil] do
      grid = Map.update(grid, point, 0, fn _ -> 0 end)

      {MapSet.put(set, point), grid}
      |> flash({row - 1, col})
      |> inc({row - 1, col})
      |> flash({row + 1, col})
      |> inc({row + 1, col})
      |> flash({row, col - 1})
      |> inc({row, col - 1})
      |> flash({row, col + 1})
      |> inc({row, col + 1})
      |> flash({row - 1, col - 1})
      |> inc({row - 1, col - 1})
      |> flash({row + 1, col + 1})
      |> inc({row + 1, col + 1})
      |> flash({row - 1, col + 1})
      |> inc({row - 1, col + 1})
      |> flash({row + 1, col - 1})
      |> inc({row + 1, col - 1})
    else
      {set, grid}
    end
  end

  def flash(x, _), do: x

  def inc({set, grid}, {row, col} = point) when row in 0..9 and col in 0..9 do
    flash(
      {set,
       grid
       |> Map.update!(point, fn v ->
         if v not in [0] do
           v + 1
         else
           v
         end
       end)},
      point
    )
  end

  def inc(x, _), do: x

  def input do
    File.read!("lib/day11/input.txt")
    |> Advent2021.Parser.parse_list(&Function.identity(&1))
  end
end
