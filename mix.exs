defmodule ExampleElixir.Mixfile do
  use Mix.Project

  def project do
    [app: :example_elixir,
     version: "0.0.1",
     elixir: "~> 1.0.0",
     deps: deps]
  end

  def application do
    [applications: [:logger, :cowboy, :plug, :httpoison]]
  end

  defp deps do
    [
      {:cowboy, "~> 1.0.0"},
      {:plug, "~> 0.8.0"},
      {:calliope, "~> 0.2.8"},
      {:poison, "~> 1.1.1"},
      {:traitify_elixir, "~> 0.1.1"}
    ]
  end
end
