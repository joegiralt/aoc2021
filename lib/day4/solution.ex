defmodule Aoc2021.Day4.Solution do
  alias Aoc2021.Utils.Matrix, as: M
  defstruct draw: [], boards: []

  require IEx

  def part(number) do
    new() |> solve(number)
  end

  def drawn_set(drawing, idx) do
    drawing
    |> Enum.take(idx + 5)
    |> MapSet.new()
  end

  def solve(game, 1) do
    game
    |> find_winning_boards()
    |> Enum.reject(&is_nil/1)
    |> List.first()
    |> reduce_to_answer(game)
  end

  def solve(game, 2) do
    game
    |> find_winning_boards()
    |> Enum.reject(&is_nil/1)
    |> Enum.map(&reduce_to_answer(&1, game))
  end

  def find_winning_boards(game) do
    game.draw
    |> Enum.with_index()
    |> Enum.flat_map(fn {_x, idx} ->
      drawn_set = drawn_set(game.draw, idx)

      game.boards
      |> Enum.flat_map(&find_winning_board(&1, drawn_set))
    end)
  end

  def find_winning_board(board, drawn_set) do
    board
    |> Enum.map(fn row_set ->
      if MapSet.intersection(drawn_set, row_set) |> Enum.count() == 5 do
        {board, drawn_set}
      end
    end)
  end

  def reduce_to_answer(pair, game) do
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
  end

  def new() do
    [input_draws | input_boards] =
      input()
      |> Enum.chunk_by(fn x -> x != "" end)
      |> Enum.reject(fn x -> x == [""] end)

    %{
      draw: input_draws |> List.first() |> String.split(",") |> Enum.map(&String.to_integer(&1)),
      boards:
        input_boards
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
    File.read!("lib/day4/test.txt")
    |> Advent2021.Parser.parse_list(&Function.identity(&1))
  end

  def bingo(matrix) do
    [
      # columns
      matrix
      |> M.unwrap()
      |> MapSet.new()
      |> Enum.map(&MapSet.new(&1)),
      # rows
      matrix
      |> M.transpose()
      |> M.unwrap()
      |> Enum.map(&MapSet.new(&1))
    ]
    |> List.flatten()
  end
end
