defmodule UeberauthSteam.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ueberauth_steam,
      description: "Steam OpenID Strategy for Überauth.",
      version: "0.1.1",
      elixir: "~> 1.7",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      package: package(),

      # Testing
      #test_coverage: [tool: ExCoveralls],
      #preferred_cli_env: ["coveralls": :test, "coveralls.detail": :test, "coveralls.post": :test, "coveralls.html": :test],
      dialyzer: [ignore_warnings: "dialyzer.ignore-warnings"],

      # Docs
      name: "Überauth Steam",
      source_url: "https://github.com/shinyscorpion/ueberauth_steam",
      homepage_url: "https://github.com/shinyscorpion/ueberauth_steam",
      docs: [
        main: "readme",
        extras: ["README.md"],
      ],
    ]
  end

  def package do
    [
      name: :ueberauth_steam,
      maintainers: ["Ian Luites"],
      licenses: ["MIT"],
      files: [
        "lib/ueberauth", "lib/ueberauth_steam.ex", "mix.exs", "README*", "LICENSE*", # Elixir
      ],
      links: %{
        "GitHub" => "https://github.com/shinyscorpion/ueberauth_steam",
      },
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      # Dependencies
      {:httpoison, "~> 1.4"},
      {:poison, "~> 3.1"},
      {:ueberauth, "~> 0.6"},

      # Testing
      {:meck, "~> 0.8.13", only: :test},

      # Code Maintenance
      {:credo, "~> 1.0.0", only: [:dev, :test]},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.19", only: :dev}
    ]
  end
end
