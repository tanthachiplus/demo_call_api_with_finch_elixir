defmodule DemoCallApiWithFinchElixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      DemoCallApiWithFinchElixirWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: DemoCallApiWithFinchElixir.PubSub},
      # Start the Endpoint (http/https)
      DemoCallApiWithFinchElixirWeb.Endpoint,
      {Finch, name: MyFinch}
      # Start a worker by calling: DemoCallApiWithFinchElixir.Worker.start_link(arg)
      # {DemoCallApiWithFinchElixir.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DemoCallApiWithFinchElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DemoCallApiWithFinchElixirWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
