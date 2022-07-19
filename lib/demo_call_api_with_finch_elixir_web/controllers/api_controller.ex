defmodule DemoCallApiWithFinchElixirWeb.Api do
  use DemoCallApiWithFinchElixirWeb, :controller

  def get(conn, params) do
    conn
    |> put_resp_content_type("applicaton/json")
    |> send_resp(200,
      %{
        what_api: "IN IN GETTT api."
      }
      |> Map.merge(params)
      |> Poison.encode!()
    )
  end

  def post(conn, params) do
    conn
    |> put_resp_content_type("applicaton/json")
    |> send_resp(200,
      %{
        what_api: "IN IN POOOOOOST api."
      }
      |> Map.merge(params)
      |> Poison.encode!()
    )
  end
end
