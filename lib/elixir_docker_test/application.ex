defmodule ElixirDockerTest.Application do
  use Application

  def start(_start_type, _start_args) do
    children = [
      ElixirDockerTest.Endpoint
    ]

    opts = [strategy: :one_for_one, name: ElixirDockerTest.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
