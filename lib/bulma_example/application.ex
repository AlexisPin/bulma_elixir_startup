defmodule BulmaExample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      BulmaExampleWeb.Telemetry,
      BulmaExample.Repo,
      {DNSCluster, query: Application.get_env(:bulma_example, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: BulmaExample.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: BulmaExample.Finch},
      # Start a worker by calling: BulmaExample.Worker.start_link(arg)
      # {BulmaExample.Worker, arg},
      # Start to serve requests, typically the last entry
      BulmaExampleWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BulmaExample.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BulmaExampleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
