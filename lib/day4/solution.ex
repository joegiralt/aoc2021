defmodule Aoc2021.Day4.Solution do
  alias Aoc2021.Utils.Matrix, as: M
  defstruct draw: [], boards: []

  def part(number) do
    new() |> solve(number)
  end

  def drawn_set(drawing, idx) do
    drawing
    |> Enum.take(idx + 5)
    |> MapSet.new()
  end

  def solve(game, part_number) do
    game
    |> find_winning_board(part_number)
    |> reduce_to_answer(game.draw)
  end

  def bingo?(board, drawn_set) do
    board
    |> Enum.map(fn row_set ->
      MapSet.intersection(drawn_set, row_set) |> Enum.count() == 5
    end)
    |> Enum.uniq()
    |> Enum.sort()
    |> List.last()
  end

  def find_winning_board(game, 1) do
    game.draw
    |> Enum.with_index()
    |> Enum.map(fn {_x, idx} ->
      drawn_set = drawn_set(game.draw, idx)

      {
        game.boards
        |> Enum.find(&bingo?(&1, drawn_set))
        |> List.wrap(),
        drawn_set
      }
    end)
    |> Enum.reject(fn {board, _} -> [] == board end)
    |> List.first()
  end

  def find_winning_board(game, 2) do
    result =
      game.boards
      |> Flow.from_enumerable(max_demand: 1, stages: Enum.count(game.boards))
      |> Flow.partition(max_demand: 5)
      |> Flow.map(fn board ->
        idx =
          Range.new(0, Enum.count(game.draw))
          |> Enum.find(fn idx ->
            drawn_set = drawn_set(game.draw, idx)
            bingo?(board, drawn_set)
          end)

        {idx, board, drawn_set(game.draw, idx)}
      end)
      |> Enum.to_list()
      |> Enum.sort()
      |> List.last()

    {_draw_idx, board, draw_set} = result
    {board, draw_set}
  end

  def reduce_to_answer(pair, draw) do
    {bingo_board, winning_draw} = pair

    bingo_board
    |> Enum.map(fn row_set ->
      MapSet.difference(row_set, winning_draw)
    end)
    |> Enum.map(&MapSet.to_list(&1))
    |> List.flatten()
    |> (fn remaining_list_vals ->
          Enum.sum(remaining_list_vals) / 2 *
            Enum.at(draw, Enum.count(winning_draw) - 1)
        end).()
  end

  def new() do
    [input_draws | input_boards] =
      input()
      |> Enum.chunk_by(fn x -> x != "" end)
      |> Enum.reject(fn x -> x == [""] end)

    %{
      draw:
        input_draws
        |> List.first()
        |> String.split(",")
        |> Enum.map(&String.to_integer(&1)),
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
        |> Enum.map(&craft_board(&1))
    }
  end

  def input do
    File.read!("lib/day4/input.txt")
    |> Advent2021.Parser.parse_list(&Function.identity(&1))
  end

  def craft_board(matrix) do
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
