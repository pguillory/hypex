defmodule Hypex.Mixfile do
  use Mix.Project

  @url_docs "http://hexdocs.pm/hypex"
  @url_github "https://github.com/zackehh/hypex"

  def project do
    [
      app: :hypex,
      name: "Hypex",
      description: "Fast HyperLogLog implementation for Elixir/Erlang",
      package: %{
        files: [
          "lib",
          "mix.exs",
          "LICENSE",
          "README.md"
        ],
        licenses: [ "MIT" ],
        links: %{
          "Docs" => @url_docs,
          "GitHub" => @url_github
        },
        maintainers: [ "Isaac Whitfield" ]
      },
      version: "1.0.0",
      elixir: "~> 1.1",
      deps: deps,
      docs: [
        extras: [ "README.md" ],
        source_ref: "master",
        source_url: @url_github
      ],
      test_coverage: [
        tool: ExCoveralls
      ],
      preferred_cli_env: [
        "bench": :test,
        "coveralls": :test,
        "coveralls.detail": :test,
        "coveralls.html": :test,
        "coveralls.travis": :test,
        "docs": :docs
      ]
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      # documentation
      { :earmark, "~> 0.2.1",  optional: true, only: :docs },
      { :ex_doc,  "~> 0.11.4", optional: true, only: :docs },
      # testing
      { :benchfella,   "~> 0.3.2", optional: true, only: :test },
      { :excoveralls,  "~> 0.5.1", optional: true, only: :test },
      { :power_assert, "~> 0.0.8", optional: true, only: :test }
    ]
  end
end
