defmodule Aoc2021.Day14.Solution do
  require IEx
  def part(_, steps) do
    [sequence, transforms] = input()

    links =
      transforms
      |> String.split("\n", trim: true)
      |> Enum.map(fn line ->
        line
        |> String.split(" -> ", trim: true)
        |> List.to_tuple()
        |> then(fn {left_hand_side, right_hand_side} ->
          {String.split(left_hand_side, "", trim: true), right_hand_side}
        end)
      end)
      |> Map.new()

    {{_, min}, {_, max}} =
      sequence
      |> String.codepoints()
      |> Enum.chunk_every(2, 1)
      |> Enum.frequencies()
      |> Stream.iterate(&build_polymer_chains(&1, links))
      |> Enum.at(steps)
      |> Enum.reduce(%{}, fn {[chr | _chars], count}, counts ->
        Map.update(counts, chr, count, &(&1 + count))
      end)
      |> Enum.min_max_by(fn {_, count} -> count end)

    max - min
  end

  def build_polymer_chains(polymer_frequncies, links) do
    polymer_frequncies
    |> Enum.map(fn
      {[a, b] = ab, count} ->
        polymer_lookup = links[ab]
        [{[a, polymer_lookup], count}, {[polymer_lookup, b], count}]

      x ->
        x
    end)
    |> List.flatten()
    |> Enum.reduce(%{}, fn {l, count}, counts -> Map.update(counts, l, count, &(&1 + count)) end)
  end

  def input do
    File.read!("lib/day14/input.txt")
    |> String.split("\n\n", trim: true)
  end
end
