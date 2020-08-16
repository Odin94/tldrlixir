defmodule Tldrlixir.MixProject do
  use Mix.Project

  def project do
    [
      app: :tldrlixir,
      version: "0.1.0",
      escript: escript(),
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  defp escript do
    [main_module: Tldrlixir.CLI]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:licensir, "~> 0.6"},
      {:stdout_formatter, "~> 0.2.3"}
    ]
  end
end
