defmodule Aoc2021.Day16.Solution do
  require IEx

  def part(_) do
    input()
    |> parse_packet()
  end

  def hex_to_bits(string) do
    string
    |> String.codepoints()
    |> Enum.map(&String.to_integer(&1, 16))
    |> Enum.map(&<<&1::4>>)
    |> Enum.reduce(<<>>, &<<&2::bits, &1::bits>>)
  end

  def input do
    File.read!("lib/day16/input.txt")
    |> Advent2021.Parser.parse_list(&Function.identity/1)
    |> List.first()
    |> hex_to_bits
  end

  def parse_literal(bits, lit \\ 0) do
    case bits do
      <<1::1, val::4, rest::bits>> -> parse_literal(rest, lit * 16 + val)
      <<0::1, val::4, rest::bits>> -> {rest, 0, lit * 16 + val}
    end
  end

  def parse_op_code_bits(bits, vsum, data, n) do
    case n do
      0 ->
        {bits, vsum, data}

      n ->
        {rest, vsum2, val} = parse_packet(bits)
        n = n - (bit_size(bits) - bit_size(rest))
        parse_op_code_bits(rest, vsum + vsum2, [val | data], n)
    end
  end

  def parse_op_packets(bits, vsum, data, n) do
    case n do
      0 ->
        {bits, vsum, data}

      n ->
        {rest, vsum2, val} = parse_packet(bits)
        parse_op_packets(rest, vsum + vsum2, [val | data], n - 1)
    end
  end

  def parse_op_code(bits, oper) do
    {rest, vsum, data} =
      case bits do
        <<0::1, len::15, rest::bits>> -> parse_op_code_bits(rest, 0, [], len)
        <<1::1, len::11, rest::bits>> -> parse_op_packets(rest, 0, [], len)
      end

    {rest, vsum, oper.(data)}
  end

  def parse_packet(bits) do
    <<ver::3, type::3, rest::bits>> = bits

    case type do
      0 -> parse_op_code(rest, &Enum.sum(&1))
      1 -> parse_op_code(rest, &Enum.product(&1))
      2 -> parse_op_code(rest, &Enum.min(&1))
      3 -> parse_op_code(rest, &Enum.max(&1))
      4 -> parse_literal(rest)
      5 -> parse_op_code(rest, &op(5, &1))
      6 -> parse_op_code(rest, &op(6, &1))
      7 -> parse_op_code(rest, &op(7, &1))
    end
    |> then(fn {rest, vsum, data} -> {rest, vsum + ver, data} end)
  end

  def op(5, [b, a]) when a > b do
    1
  end

  def op(6, [b, a]) when a < b do
    1
  end

  def op(7, [a, a]), do: 1
  def op(_, _), do: 0
end
