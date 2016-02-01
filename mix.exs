defmodule Kindred.Mixfile do
  use Mix.Project

  def project do
    [app: :kindred,
      version: "0.0.1",
      elixir: "~> 1.2",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps,
      description: description,
      package: package,
      source_url: "https://github.com/matthewferderber/kindred"]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison, :ex_rated]]
  end

  defp deps do
    [{:httpoison, "~> 0.8.1"},
    { :poison, "~> 2.0.1" },
    { :ex_doc, "~> 0.11.0", only: :dev},
    {:earmark, ">= 0.0.0", only: :dev},
    {:ex_rated, "~> 1.2.1"}]
  end
  defp package do
    [ maintainers: ["Matthew Ferderber"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/matthewferderber/kindred"}]
  end
  defp description do
    """
    League of Legends API client written in Elixir
    """
  end
end
