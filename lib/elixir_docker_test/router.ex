defmodule ElixirDockerTest.Router do
  use Plug.Router

  plug(Plug.Static,
    at: "/",
    from: :elixir_docker_test,
    only: ~w(index.html bg.jpeg),
    gzip: false
  )

  plug(:match)
  plug(:dispatch)

  get "/" do
    conn
    |> put_resp_header("location", "/index.html")
    |> send_resp(302, "")
  end

  match _ do
    send_resp(conn, 404, "Not Found")
  end
end
