defmodule ElixirDockerTest.Endpoint do
  def child_spec(_) do
    Plug.Cowboy.child_spec(
      scheme: :http,
      plug: ElixirDockerTest.Router,
      options: [port: 4000]
    )
  end
end
