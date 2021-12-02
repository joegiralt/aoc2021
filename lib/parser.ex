defmodule Advent2021.Parser do
  def parse_list(raw, delimeter \\ "\n", f) do
    raw
    |> String.trim()
    |> String.split(delimeter)
    |> Enum.map(f)
  end
end
