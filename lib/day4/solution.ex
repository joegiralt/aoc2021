defmodule Aoc2021.Day4.Solution do
  alias Aoc2021.Utils.Matrix, as: M
  defstruct draw: [], boards: []
  # alias __MODULE__, as: S

  require IEx

  def part(1) do
    input()
    |> new()
    |> solve(1)
  end

  def part(2) do
  end

  def drawn_set(drawing, idx) do
    drawing
    |> Enum.take(idx + 5)
    |> MapSet.new()
  end

  def solve(game, 1) do
    drawing = game.draw

    drawing
    |> Enum.with_index()
    |> Enum.flat_map(fn {_x, idx} ->
      drawn_set = drawn_set(drawing, idx)

      game.boards
      |> Enum.flat_map(fn board ->
        board
        |> Enum.map(fn row_set ->
          if MapSet.intersection(drawn_set, row_set) |> Enum.count() == 5 do
            {board, drawn_set}
          end
        end)
      end)
    end)
    |> Enum.reject(&is_nil/1)
    |> List.first()
    |> (fn pair ->
          {bingo_board, winning_draw} = pair

          bingo_board
          |> Enum.map(fn row_set ->
            MapSet.difference(row_set, winning_draw)
          end)
          |> Enum.map(&MapSet.to_list(&1))
          |> List.flatten()
          |> (fn remaining_list_vals ->
                Enum.sum(remaining_list_vals) / 2 *
                  Enum.at(game.draw, Enum.count(winning_draw) - 1)
              end).()
        end).()
  end

  def boards(sol) do
    sol.boards
  end

  def new(input) do
    [_ | tail] =
      input()
      |> Enum.chunk_by(fn x -> x != "" end)
      |> Enum.reject(fn x -> x == [""] end)

    %{
      draw: input |> List.first() |> String.split(",") |> Enum.map(&String.to_integer(&1)),
      boards:
        tail
        |> Enum.map(fn collect ->
          collect
          |> Enum.map(fn str ->
            str
            |> String.split(" ")
            |> Enum.filter(fn str -> str != "" end)
            |> Enum.map(&String.to_integer(&1))
          end)
        end)
        |> Enum.map(&M.new(&1))
        |> Enum.map(&bingo(&1))
    }
  end

  def input do
    File.read!("lib/day4/input.txt")
    |> Advent2021.Parser.parse_list(&Function.identity(&1))
  end

  def bingo(matrix) do
    horizontal =
      matrix
      |> M.unwrap()
      |> MapSet.new()
      |> Enum.map(&MapSet.new(&1))

    column =
      matrix
      |> M.transpose()
      |> M.unwrap()
      |> Enum.map(&MapSet.new(&1))

    Map.values(%{
      horizontal: horizontal,
      column: column
    })
    |> List.flatten()
  end
end
