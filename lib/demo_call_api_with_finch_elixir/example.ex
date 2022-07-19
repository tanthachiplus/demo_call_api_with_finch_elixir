defmodule Example do

  def get() do
    header =
      [
        {"content-type", "application/json"}
      ]

    # bước 1 encode params map
    params = %{a: 1, b: 2}
    query = URI.encode_query(params)
    # bước 2 gọi finch
    Finch.build(:get, "http://localhost:4000/get?#{query}", header) |> Finch.request(MyFinch)
  end

  def post() do
    header =
      [
        {"content-type", "application/json"}
      ]

    # bước 1 encode params map TO JSON body
    params = %{a: 1, b: 2}
    body = Jason.encode!(params)
    # bước 2 gọi finch
    Finch.build(:post, "http://localhost:4000/post", header, body) |> Finch.request(MyFinch)
  end
end
