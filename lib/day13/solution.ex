defmodule Aoc2021.Day13.Solution do
  require IEx

  def part(1) do
    [coords, folds] =
      input()
      |> String.split("\n\n", trim: true)

    coords =
      coords
      |> String.split("\n", trim: true)
      # match nums
      |> Enum.filter(&String.match?(&1, ~r/\d+/))
      |> Enum.map(fn line ->
        line
        |> String.split(",", trim: true)
        |> Enum.map(&String.to_integer/1)
        |> then(fn [x, y] -> {x, y} end)
      end)
      |> MapSet.new()

    folds =
      folds
      |> String.split("\n", trim: true)
      |> Enum.map(fn line ->
        line
        |> String.split("=")
        |> then(fn [x, num] ->
          {x
           |> String.codepoints()
           |> Enum.reverse()
           |> List.first(), String.to_integer(num)}
        end)
      end)

    folder(Enum.take(folds, 1), coords, 1) |> Enum.count()
  end

  def part(2) do
    [points, folds] =
      input()
      |> String.split("\n\n", trim: true)

    folds =
      folds
      |> String.split("\n", trim: true)
      |> Enum.map(
        &(&1
          |> String.split("=")
          |> then(fn
            [x, num] ->
              {x
               |> String.codepoints()
               |> List.last(), String.to_integer(num)}
          end))
      )

    points =
      points
      |> String.split("\n", trim: true)
      |> Enum.filter(&String.match?(&1, ~r/\d+/))
      |> Enum.map(fn line ->
        line
        |> String.split(",", trim: true)
        |> Enum.map(&String.to_integer/1)
        |> List.to_tuple()
      end)
      |> folder(folds, 2)

    {x, y} =
      points
      |> Enum.unzip()
      |> then(fn
        {xs, ys} ->
          {Enum.max(xs), Enum.max(ys)}
      end)

    Enum.map_join(0..y, "\n", fn
      y ->
        Enum.map_join(0..x, "", fn
          x ->
            cond do
              MapSet.member?(points, {x, y}) -> "#"
              true -> " "
            end
        end)
    end)
  end

  def folder(folds, points, 1), do: folder(points, folds)
  def folder(points, folds, 2), do: folder(points, folds)

  def folder(points, folds) do
    folds
    |> Enum.reduce(points, fn
      {direction, crease}, points ->
        points
        |> Enum.map(&fold(direction, crease, &1))
        |> MapSet.new()
    end)
  end

  def fold("x", n, {x, y} = _p) when x > n do
    {n - (x - n), y}
  end

  def fold("x", _n, p), do: p

  def fold("y", n, {x, y} = _p) when y > n do
    {x, n - (y - n)}
  end

  def fold("y", _n, p), do: p

  def input do
    File.read!("lib/day13/input.txt")
  end
end
