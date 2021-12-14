defmodule Aoc2021.MixProject do
  use Mix.Project

  def project do
    [
      app: :aoc2021,
      version: "0.1.0",
      elixir: "~> 1.13-dev",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:libgraph, "~> 0.7"},
      {:fastglobal, "~> 1.0"},
      {:benchee, "~> 1.0", only: :dev},
      {:flow, "~> 1.0"},
      {:exla, "~> 0.1.0-dev", github: "elixir-nx/nx", sparse: "exla"},
      {:nx, "~> 0.1.0-dev", github: "elixir-nx/nx", branch: "main", sparse: "nx", override: true},
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false}
    ]
  end
end
