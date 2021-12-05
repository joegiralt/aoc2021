defmodule Aoc2021.Utils.Line do
  alias Aoc2021.Utils.Geometry, as: Geo
  require IEx

  defstruct points: nil, start: nil, end: nil, point_coords: nil

  alias __MODULE__, as: L

  def new(line) do
    [x1, x2, y1, y2] = line

    %L{
      points: Geo.number_of_points(line),
      start: {x1, x2},
      end: {y1, y2},
      point_coords: Geo.get_point_coords(line)
    }
  end
end
