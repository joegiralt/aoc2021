defmodule Aoc2021.Utils.Matrix do
  require IEx

  defstruct data: nil, width: nil, depth: nil

  alias __MODULE__, as: M

  def new(two_dee_array) do
    %M{
      data: two_dee_array,
      width: two_dee_array |> List.first() |> Enum.count(),
      depth: Enum.count(two_dee_array)
    }
  end

  def unwrap(%M{data: data}) do
    data
  end

  def transpose(%M{data: data}) do
    List.zip(data)
    |> Enum.map(&Tuple.to_list(&1))
    |> new
  end
end
