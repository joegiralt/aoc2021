defmodule Aoc2021.Utils.Memoize do
  @moduledoc """
  Simple memoization helper built on top of FastGlobal.
  """

  @doc """
  If previously saved value exists, return that else
  perform memoization for given key and function.
  """
  def run(key, fun) when is_atom(key) do
    case get!(key) do
      nil ->
        value = fun.()
        put!(key, value)
        value

      result ->
        result
    end
  end

  @doc "Force get value"
  defdelegate get!(key), to: FastGlobal, as: :get

  @doc "Force put value"
  defdelegate put!(key, value), to: FastGlobal, as: :put
end
