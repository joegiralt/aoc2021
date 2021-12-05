defmodule Aoc2021.Utils.Geometry do
  require IEx

  # gcd(𝑐−𝑎,𝑑−𝑏)+1
  def number_of_points(line) do
    [a, b, c, d] = line
    Integer.gcd(c - a, d - b) + 1
  end

  def get_point_coords(line) do
    [x1, y1, x2, y2] = line
    steep = abs(y2 - y1) > abs(x2 - x1)
    rev = !steep && x1 > x2

    {x1, y1} =
      if steep do
        {y1, x1}
      else
        {x1, y1}
      end

    {x2, y2} =
      if steep do
        {y2, x2}
      else
        {x2, y2}
      end

    [{x1, x2}, {y1, y2}] =
      if x1 > x2 do
        [{x2, x1}, {y2, y1}]
      else
        [{x1, x2}, {y1, y2}]
      end

    deltax = x2 - x1
    deltay = abs(y2 - y1)

    error = div(deltax, 2)
    y = y1

    ystep =
      if y1 < y2 do
        1
      else
        -1
      end

    range_list = Range.new(x1, x2) |> Enum.to_list()

    gather_points(range_list, [], y, error, steep, deltay, deltax, ystep)

    |> (fn points ->
          if rev do
            points |> Enum.reverse()
          else
            points
          end
        end).()
  end

  defp gather_points([], points, _y, _error, _steep, _deltay, _deltax, _ystep) do
    points
  end

  defp gather_points(range_list, points, y, error, steep, deltay, deltax, ystep) do
    [x | tail_range_list] = range_list

    point =
      if steep do
        {y, x}
      else
        {x, y}
      end

    error = error - deltay

    y =
      if error < 0 do
        y + ystep
      else
        y
      end

    error =
      if error < 0 do
        error + deltax
      else
        error
      end

    total_points = points ++ [point]
    gather_points(tail_range_list, total_points, y, error, steep, deltay, deltax, ystep)
  end
end
