defmodule ElixirDockerTest.Endpoint do
  def child_spec(_) do
    port = String.to_integer(System.get_env("PORT") || "4000")

    Plug.Cowboy.child_spec(
      scheme: :http,
      plug: ElixirDockerTest.Router,
      options: [ip: {0, 0, 0, 0}, port: port]
    )
  end
end
