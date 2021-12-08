defmodule Aoc2021.Day8.Solution do
  require IEx

  def part(1) do
    input()
    |> Flow.from_enumerable(max_demand: 1, stages: 1)
    |> Flow.partition(max_demand: 1)
    |> Flow.map(&List.last(&1))
    |> Flow.flat_map(&String.split(&1, " "))
    |> Flow.map(&String.length(&1))
    |> Flow.map(&map_num(&1))
    |> Enum.to_list()
    |> Enum.frequencies()
    |> Map.delete(0)
    |> Map.values()
    |> Enum.sum()
  end

  # segment counts of numbers number
  # 2 -> [1]
  # 3 -> [7]
  # 4 -> [4]
  # 5 -> [2,3,5]
  # 6 -> [6,9,0]
  # 7 -> [8]

  # No top rung    [1,4]
  # middle rung [2,3,4,5,6,8,9]

  #  top rung = (7 - 1)
  #  middle.bottom.of 3 = (7-3)
  #  4 shares 3 rungs with 3

  def part(2) do
    File.stream!("lib/day8/input.txt", read_ahead: 10)
    |> Flow.from_enumerable(max_demand: 5, stages: 10)
    |> Flow.partition(max_demand: 5)
    |> Flow.map(&(&1 |> String.trim() |> String.split("\n") |> List.first()))
    |> Flow.map(&(&1 |> String.split([" ", " | "]) |> Enum.split(10)))
    |> Flow.map(fn {input, output} ->
      input
      |> Enum.map(fn number ->
        number
        |> String.split("", trim: true)
      end)
      |> Enum.group_by(&length/1)
      |> then(fn map ->
        # known by lengths
        one = List.first(map[2])
        seven = List.first(map[3])
        four = List.first(map[4])
        eight = List.first(map[7])

        # 5 lengths -> [2,3,5]
        three = Enum.find(map[5], &(length(&1 -- one) == 3))
        five = Enum.find(map[5] -- [three], &(length(&1 -- four) == 2))
        two = List.first(map[5] -- [three, five])

        # 6 lengths -> [6,9,0]
        nine = Enum.find(map[6], &(length(&1 -- three) == 1))
        six = Enum.find(map[6] -- [nine], &(length(&1 -- one) == 5))
        zero = List.first(map[6] -- [nine, six])

        [zero, one, two, three, four, five, six, seven, eight, nine]
        |> Enum.map(&Enum.sort/1)
        |> Enum.zip(0..9)
        |> Enum.into(%{})
      end)
      |> then(fn lookup ->
        output
        |> Enum.map(fn number ->
          number
          |> String.split("", trim: true)
          |> Enum.sort()
        end)
        |> Enum.map(&Map.fetch!(lookup, &1))
      end)
    end)
    |> Flow.map(&Integer.undigits/1)
    |> Enum.to_list()
    |> Enum.sum()
  end

  def map_num(2), do: 1
  def map_num(3), do: 7
  def map_num(4), do: 4
  def map_num(7), do: 8
  def map_num(_), do: 0

  # def code_to_mapset(code \\ "") do
  #   code
  #   |> String.split("", trim: true)
  #   |> MapSet.new()
  # end

  # @spec code_intersections(binary, binary) :: MapSet.t(any)
  # def code_intersections(a, b) do
  #   MapSet.intersection(code_to_mapset(a), code_to_mapset(b))
  # end

  # def is_three(map, code) do
  #   Enum.count(code) == 5 && Enum.count(code_intersections(code, map[7]))
  # end

  def input do
    File.read!("lib/day8/test.txt")
    |> Advent2021.Parser.parse_list(&Function.identity(&1))
    |> Enum.map(&String.split(&1, " | "))
  end
end
