defmodule Vodka.MixProject do
  use Mix.Project

  def project do
    [
      app: :vodka,
      version: "0.2.2",
      elixir: "~> 1.6",
      escript: [
        main_module: Vodka
      ],
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      application: [:httpoison],
      extra_applications: [:logger]
    ]
  end


  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:poison, "~> 3.1"},
      {:httpoison, "~> 1.0"},
      {:goth, "~> 1.0.1"},
      {:ex_doc, ">= 0.0.0", only: :dev}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end

  defp package() do
    [
      # This option is only needed when you don't want to use the OTP application name
      name: "vodka",
      # These are the default files included in the package
      files: ~w(lib mix.exs README*),
      licenses: ["Apache 2.0"],
      links: %{
        "Gitlab" => "https://gitlab.com/bhelper/vodka"
      }
    ]
  end

  defp description() do
    "Dialogflow SDK in elixir "
  end
end
