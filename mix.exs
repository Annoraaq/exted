defmodule ExTed.MixProject do
  use Mix.Project

  def project do
    [
      app: :exted,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp description() do
    "ExTed is a naive implementation of a tree edit distance algorithm in Elixir. Please note that this algorithm has exponential runtime complexity!"
  end
  
  defp package() do
    [
      # These are the default files included in the package
      files: ["lib", "mix.exs", "README*"],
      maintainers: ["Johannes Baum"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/Annoraaq/exted"}
    ]
  end
  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end
